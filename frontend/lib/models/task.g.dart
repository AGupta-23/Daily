// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
      id: json['id'] as String,
      content: json['content'] as String,
      datetime: DateTime.parse(json['datetime'] as String),
      priority: $enumDecode(_$TaskPriorityEnumMap, json['priority']),
      type: $enumDecode(_$TaskTypeEnumMap, json['type']),
      status: $enumDecode(_$TaskStatusEnumMap, json['status']),
      flexible: json['flexible'] as bool,
      durationMinutes: (json['duration_minutes'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'datetime': instance.datetime.toIso8601String(),
      'priority': _$TaskPriorityEnumMap[instance.priority]!,
      'type': _$TaskTypeEnumMap[instance.type]!,
      'status': _$TaskStatusEnumMap[instance.status]!,
      'flexible': instance.flexible,
      'duration_minutes': instance.durationMinutes,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

const _$TaskPriorityEnumMap = {
  TaskPriority.low: 'low',
  TaskPriority.medium: 'medium',
  TaskPriority.high: 'high',
};

const _$TaskTypeEnumMap = {
  TaskType.task: 'task',
  TaskType.reminder: 'reminder',
  TaskType.event: 'event',
};

const _$TaskStatusEnumMap = {
  TaskStatus.pending: 'pending',
  TaskStatus.completed: 'completed',
  TaskStatus.cancelled: 'cancelled',
};

_$TaskRequestImpl _$$TaskRequestImplFromJson(Map<String, dynamic> json) =>
    _$TaskRequestImpl(
      content: json['content'] as String,
      datetime: DateTime.parse(json['datetime'] as String),
      priority: $enumDecode(_$TaskPriorityEnumMap, json['priority']),
      type: $enumDecode(_$TaskTypeEnumMap, json['type']),
      flexible: json['flexible'] as bool,
      durationMinutes: (json['duration_minutes'] as num).toInt(),
    );

Map<String, dynamic> _$$TaskRequestImplToJson(_$TaskRequestImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
      'datetime': instance.datetime.toIso8601String(),
      'priority': _$TaskPriorityEnumMap[instance.priority]!,
      'type': _$TaskTypeEnumMap[instance.type]!,
      'flexible': instance.flexible,
      'duration_minutes': instance.durationMinutes,
    };
