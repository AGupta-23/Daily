import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import '../config/app_config.dart';
import '../core/exceptions.dart';

/// HTTP client wrapper with error handling and retry logic
class ApiClient {
  late final Dio _dio;
  final Logger _logger = Logger();

  ApiClient({String? baseUrl}) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl ?? AppConfig.apiBaseUrl,
        connectTimeout: AppConfig.connectTimeout,
        receiveTimeout: AppConfig.receiveTimeout,
        sendTimeout: AppConfig.sendTimeout,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    // Add interceptors for logging and error handling
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          _logger.d('REQUEST[${options.method}] => ${options.uri}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          _logger.d(
              'RESPONSE[${response.statusCode}] => ${response.requestOptions.uri}');
          return handler.next(response);
        },
        onError: (error, handler) {
          _logger.e(
            'ERROR[${error.response?.statusCode}] => ${error.requestOptions.uri}',
            error: error,
          );
          return handler.next(error);
        },
      ),
    );
  }

  /// GET request with retry logic
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    bool retry = true,
  }) async {
    return _executeWithRetry(
      () => _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      ),
      retry: retry,
    );
  }

  /// POST request with retry logic
  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    bool retry = true,
  }) async {
    return _executeWithRetry(
      () => _dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      ),
      retry: retry,
    );
  }

  /// PUT request with retry logic
  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    bool retry = true,
  }) async {
    return _executeWithRetry(
      () => _dio.put<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      ),
      retry: retry,
    );
  }

  /// DELETE request
  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return _executeWithRetry(
      () => _dio.delete<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      ),
      retry: false, // Don't retry deletes
    );
  }

  /// Execute request with automatic retry on failure
  Future<Response<T>> _executeWithRetry<T>(
    Future<Response<T>> Function() request, {
    required bool retry,
    int attempt = 0,
  }) async {
    try {
      return await request();
    } on DioException catch (e) {
      // Check if we should retry
      if (retry &&
          attempt < AppConfig.maxRetries &&
          _shouldRetry(e)) {
        _logger.w('Retrying request (attempt ${attempt + 1})...');
        await Future.delayed(
          AppConfig.retryDelay * (attempt + 1),
        );
        return _executeWithRetry(
          request,
          retry: retry,
          attempt: attempt + 1,
        );
      }

      // Convert DioException to custom exception
      throw _handleError(e);
    } catch (e) {
      _logger.e('Unexpected error', error: e);
      throw ApiException(
        message: 'An unexpected error occurred',
        originalError: e,
      );
    }
  }

  /// Determine if request should be retried
  bool _shouldRetry(DioException error) {
    // Retry on network errors or 5xx server errors
    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.sendTimeout ||
        error.type == DioExceptionType.connectionError) {
      return true;
    }

    if (error.response?.statusCode != null) {
      final statusCode = error.response!.statusCode!;
      return statusCode >= 500 && statusCode < 600;
    }

    return false;
  }

  /// Convert DioException to custom exception
  ApiException _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return TimeoutException();

      case DioExceptionType.connectionError:
        return NetworkException();

      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode ?? 0;
        final message = _extractErrorMessage(error.response?.data);

        if (statusCode == 401) {
          return UnauthorizedException();
        } else if (statusCode == 404) {
          return NotFoundException(message: message);
        } else if (statusCode == 422) {
          return ValidationException(
            message: message,
            errors: _extractValidationErrors(error.response?.data),
          );
        } else if (statusCode >= 400 && statusCode < 500) {
          return ClientException(
            message: message,
            statusCode: statusCode,
          );
        } else if (statusCode >= 500) {
          return ServerException(
            message: message,
            statusCode: statusCode,
          );
        }
        break;

      case DioExceptionType.cancel:
        return ApiException(message: 'Request cancelled');

      case DioExceptionType.unknown:
        if (error.error is SocketException) {
          return NetworkException();
        }
        break;

      default:
        break;
    }

    return ApiException(
      message: error.message ?? 'Unknown error occurred',
      originalError: error,
    );
  }

  /// Extract error message from response data
  String? _extractErrorMessage(dynamic data) {
    if (data is Map<String, dynamic>) {
      return data['message'] as String? ??
          data['detail'] as String? ??
          data['error'] as String?;
    }
    return null;
  }

  /// Extract validation errors from response data
  Map<String, List<String>>? _extractValidationErrors(dynamic data) {
    if (data is Map<String, dynamic> && data.containsKey('errors')) {
      final errors = data['errors'];
      if (errors is Map<String, dynamic>) {
        return errors.map((key, value) {
          if (value is List) {
            return MapEntry(key, value.cast<String>());
          }
          return MapEntry(key, [value.toString()]);
        });
      }
    }
    return null;
  }

  /// Close the client
  void close() {
    _dio.close();
  }
}