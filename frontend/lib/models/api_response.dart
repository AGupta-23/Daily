import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.freezed.dart';
part 'api_response.g.dart';

/// Health check response
@freezed
class HealthResponse with _$HealthResponse {
  const factory HealthResponse({
    required String status,
    required DateTime timestamp,
  }) = _HealthResponse;

  factory HealthResponse.fromJson(Map<String, dynamic> json) =>
      _$HealthResponseFromJson(json);
}

/// Transcription response
@freezed
class TranscriptionResponse with _$TranscriptionResponse {
  const factory TranscriptionResponse({
    required String transcription,
    required double confidence,
    required DateTime timestamp,
  }) = _TranscriptionResponse;

  factory TranscriptionResponse.fromJson(Map<String, dynamic> json) =>
      _$TranscriptionResponseFromJson(json);
}

/// Generic list response wrapper
/// Note: This is a simplified version without Freezed to avoid generic type issues
class ListResponse<T> {
  final List<T> items;
  final int total;

  const ListResponse({
    required this.items,
    required this.total,
  });

  factory ListResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    return ListResponse<T>(
      items: (json['items'] as List<dynamic>)
          .map((e) => fromJsonT(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int,
    );
  }

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T) toJsonT) {
    return {
      'items': items.map((e) => toJsonT(e)).toList(),
      'total': total,
    };
  }
}

/// Delete response
@freezed
class DeleteResponse with _$DeleteResponse {
  const factory DeleteResponse({
    required bool success,
    required String message,
  }) = _DeleteResponse;

  factory DeleteResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteResponseFromJson(json);
}

/// Timeline item (combines tasks and events)
@freezed
class TimelineItem with _$TimelineItem {
  const factory TimelineItem({
    required String id,
    required String type, // 'task', 'reminder', or 'event'
    required String content,
    required DateTime datetime,
    required String priority,
  }) = _TimelineItem;

  factory TimelineItem.fromJson(Map<String, dynamic> json) =>
      _$TimelineItemFromJson(json);
}

/// Timeline response
@freezed
class TimelineResponse with _$TimelineResponse {
  const factory TimelineResponse({
    required List<TimelineItem> items,
  }) = _TimelineResponse;

  factory TimelineResponse.fromJson(Map<String, dynamic> json) =>
      _$TimelineResponseFromJson(json);
}