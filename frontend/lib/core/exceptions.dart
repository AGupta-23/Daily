/// Base exception for API errors
class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic originalError;

  ApiException({
    required this.message,
    this.statusCode,
    this.originalError,
  });

  @override
  String toString() => 'ApiException: $message (Status: $statusCode)';
}

/// Network connection error
class NetworkException extends ApiException {
  NetworkException({String? message})
      : super(
          message: message ?? 'No internet connection. Please check your network.',
        );
}

/// Server error (5xx)
class ServerException extends ApiException {
  ServerException({String? message, super.statusCode})
      : super(
          message: message ?? 'Server error occurred. Please try again later.',
        );
}

/// Client error (4xx)
class ClientException extends ApiException {
  ClientException({String? message, super.statusCode})
      : super(
          message: message ?? 'Invalid request.',
        );
}

/// Authentication error (401)
class UnauthorizedException extends ApiException {
  UnauthorizedException()
      : super(
          message: 'Authentication required. Please log in.',
          statusCode: 401,
        );
}

/// Not found error (404)
class NotFoundException extends ApiException {
  NotFoundException({String? message})
      : super(
          message: message ?? 'Resource not found.',
          statusCode: 404,
        );
}

/// Validation error (422)
class ValidationException extends ApiException {
  final Map<String, List<String>>? errors;

  ValidationException({String? message, this.errors})
      : super(
          message: message ?? 'Validation failed.',
          statusCode: 422,
        );
}

/// Timeout error
class TimeoutException extends ApiException {
  TimeoutException()
      : super(
          message: 'Request timed out. Please try again.',
        );
}

/// Parse error
class ParseException extends ApiException {
  ParseException({String? message})
      : super(
          message: message ?? 'Failed to parse server response.',
        );
}