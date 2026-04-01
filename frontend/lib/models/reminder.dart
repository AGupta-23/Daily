import 'package:freezed_annotation/freezed_annotation.dart';

part 'reminder.freezed.dart';
part 'reminder.g.dart';

/// How the reminder is delivered
enum ReminderType {
  @JsonValue('notification')
  notification, // Silent push notification

  @JsonValue('verbal')
  verbal, // Spoken aloud via TTS

  @JsonValue('both')
  both, // Notification + TTS
}

/// Current state of the reminder
enum ReminderStatus {
  @JsonValue('pending')
  pending,

  @JsonValue('triggered')
  triggered,

  @JsonValue('snoozed')
  snoozed,

  @JsonValue('dismissed')
  dismissed,
}

/// Reminder model matching backend API
@freezed
class Reminder with _$Reminder {
  const factory Reminder({
    required String id,
    @JsonKey(name: 'task_id') required String taskId,
    @JsonKey(name: 'remind_at') required DateTime remindAt,
    required ReminderType type,
    required ReminderStatus status,
    required String message,
    @JsonKey(name: 'task_content') String? taskContent,
    @JsonKey(name: 'snoozed_until') DateTime? snoozedUntil,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _Reminder;

  factory Reminder.fromJson(Map<String, dynamic> json) =>
      _$ReminderFromJson(json);
}

/// Request model for creating a reminder
@freezed
class ReminderRequest with _$ReminderRequest {
  const factory ReminderRequest({
    @JsonKey(name: 'task_id') required String taskId,
    @JsonKey(name: 'remind_at') required DateTime remindAt,
    required ReminderType type,
    required String message,
  }) = _ReminderRequest;

  factory ReminderRequest.fromJson(Map<String, dynamic> json) =>
      _$ReminderRequestFromJson(json);
}

/// Snooze request body
@freezed
class SnoozeRequest with _$SnoozeRequest {
  const factory SnoozeRequest({
    @JsonKey(name: 'snooze_duration_minutes')
    required int snoozeDurationMinutes,
  }) = _SnoozeRequest;

  factory SnoozeRequest.fromJson(Map<String, dynamic> json) =>
      _$SnoozeRequestFromJson(json);
}

/// Extension helpers on Reminder
extension ReminderExtensions on Reminder {
  /// Is this reminder due within the next [minutes] minutes?
  bool isDueWithin(int minutes) {
    final now = DateTime.now();
    final due = snoozedUntil ?? remindAt;
    final diff = due.difference(now).inMinutes;
    return diff >= 0 && diff <= minutes;
  }

  /// Is this reminder overdue and still pending?
  bool get isOverdue {
    final now = DateTime.now();
    final due = snoozedUntil ?? remindAt;
    return status == ReminderStatus.pending && due.isBefore(now);
  }

  /// Display time — shows snoozed time if snoozed, otherwise original time
  DateTime get displayTime => snoozedUntil ?? remindAt;
}