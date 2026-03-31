import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';
part 'task.g.dart';

/// Task priority levels
enum TaskPriority {
  @JsonValue('low')
  low,
  @JsonValue('medium')
  medium,
  @JsonValue('high')
  high,
}

/// Task status
enum TaskStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('completed')
  completed,
  @JsonValue('cancelled')
  cancelled,
}

/// Task type
enum TaskType {
  @JsonValue('task')
  task,
  @JsonValue('reminder')
  reminder,
  @JsonValue('event')
  event,
}

/// Main Task model matching backend API
@freezed
class Task with _$Task {
  const factory Task({
    required String id,
    required String content,
    required DateTime datetime,
    required TaskPriority priority,
    required TaskType type,
    required TaskStatus status,
    required bool flexible,
    @JsonKey(name: 'duration_minutes') required int durationMinutes,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}

/// Request model for creating/updating tasks
@freezed
class TaskRequest with _$TaskRequest {
  const factory TaskRequest({
    required String content,
    required DateTime datetime,
    required TaskPriority priority,
    required TaskType type,
    required bool flexible,
    @JsonKey(name: 'duration_minutes') required int durationMinutes,
  }) = _TaskRequest;

  factory TaskRequest.fromJson(Map<String, dynamic> json) =>
      _$TaskRequestFromJson(json);
}

/// Extension methods for Task model
extension TaskExtensions on Task {
  /// Check if task is overdue
  bool get isOverdue =>
      status == TaskStatus.pending && datetime.isBefore(DateTime.now());

  /// Check if task is today
  bool get isToday {
    final now = DateTime.now();
    return datetime.year == now.year &&
        datetime.month == now.month &&
        datetime.day == now.day;
  }

  /// Check if task is upcoming (within next 7 days)
  bool get isUpcoming {
    final now = DateTime.now();
    final weekFromNow = now.add(const Duration(days: 7));
    return datetime.isAfter(now) && datetime.isBefore(weekFromNow);
  }

  /// Convert to TaskRequest for updates
  TaskRequest toRequest() => TaskRequest(
        content: content,
        datetime: datetime,
        priority: priority,
        type: type,
        flexible: flexible,
        durationMinutes: durationMinutes,
      );
}