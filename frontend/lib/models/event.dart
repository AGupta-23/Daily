import 'package:freezed_annotation/freezed_annotation.dart';
import 'task.dart'; // Import for TaskPriority and TaskStatus

part 'event.freezed.dart';
part 'event.g.dart';

/// Event model for calendar items
@freezed
class Event with _$Event {
  const factory Event({
    required String id,
    required String content,
    required DateTime datetime,
    @JsonKey(name: 'duration_minutes') required int durationMinutes,
    required TaskPriority priority,
    required TaskStatus status,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}

/// Extension methods for Event model
extension EventExtensions on Event {
  /// Get end time based on duration
  DateTime get endTime =>
      datetime.add(Duration(minutes: durationMinutes));

  /// Check if event is in progress
  bool get isInProgress {
    final now = DateTime.now();
    return datetime.isBefore(now) && endTime.isAfter(now);
  }

  /// Check if event is today
  bool get isToday {
    final now = DateTime.now();
    return datetime.year == now.year &&
        datetime.month == now.month &&
        datetime.day == now.day;
  }
}