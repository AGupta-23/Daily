// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReminderImpl _$$ReminderImplFromJson(Map<String, dynamic> json) =>
    _$ReminderImpl(
      id: json['id'] as String,
      taskId: json['task_id'] as String,
      remindAt: DateTime.parse(json['remind_at'] as String),
      type: $enumDecode(_$ReminderTypeEnumMap, json['type']),
      status: $enumDecode(_$ReminderStatusEnumMap, json['status']),
      message: json['message'] as String,
      taskContent: json['task_content'] as String?,
      snoozedUntil: json['snoozed_until'] == null
          ? null
          : DateTime.parse(json['snoozed_until'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$ReminderImplToJson(_$ReminderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'task_id': instance.taskId,
      'remind_at': instance.remindAt.toIso8601String(),
      'type': _$ReminderTypeEnumMap[instance.type]!,
      'status': _$ReminderStatusEnumMap[instance.status]!,
      'message': instance.message,
      'task_content': instance.taskContent,
      'snoozed_until': instance.snoozedUntil?.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
    };

const _$ReminderTypeEnumMap = {
  ReminderType.notification: 'notification',
  ReminderType.verbal: 'verbal',
  ReminderType.both: 'both',
};

const _$ReminderStatusEnumMap = {
  ReminderStatus.pending: 'pending',
  ReminderStatus.triggered: 'triggered',
  ReminderStatus.snoozed: 'snoozed',
  ReminderStatus.dismissed: 'dismissed',
};

_$ReminderRequestImpl _$$ReminderRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$ReminderRequestImpl(
      taskId: json['task_id'] as String,
      remindAt: DateTime.parse(json['remind_at'] as String),
      type: $enumDecode(_$ReminderTypeEnumMap, json['type']),
      message: json['message'] as String,
    );

Map<String, dynamic> _$$ReminderRequestImplToJson(
        _$ReminderRequestImpl instance) =>
    <String, dynamic>{
      'task_id': instance.taskId,
      'remind_at': instance.remindAt.toIso8601String(),
      'type': _$ReminderTypeEnumMap[instance.type]!,
      'message': instance.message,
    };

_$SnoozeRequestImpl _$$SnoozeRequestImplFromJson(Map<String, dynamic> json) =>
    _$SnoozeRequestImpl(
      snoozeDurationMinutes: (json['snooze_duration_minutes'] as num).toInt(),
    );

Map<String, dynamic> _$$SnoozeRequestImplToJson(_$SnoozeRequestImpl instance) =>
    <String, dynamic>{
      'snooze_duration_minutes': instance.snoozeDurationMinutes,
    };
