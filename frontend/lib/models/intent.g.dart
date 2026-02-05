// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IntentImpl _$$IntentImplFromJson(Map<String, dynamic> json) => _$IntentImpl(
      type: $enumDecode(_$TaskTypeEnumMap, json['type']),
      content: json['content'] as String,
      datetime: DateTime.parse(json['datetime'] as String),
      priority: $enumDecode(_$TaskPriorityEnumMap, json['priority']),
      flexible: json['flexible'] as bool,
      durationMinutes: (json['duration_minutes'] as num).toInt(),
    );

Map<String, dynamic> _$$IntentImplToJson(_$IntentImpl instance) =>
    <String, dynamic>{
      'type': _$TaskTypeEnumMap[instance.type]!,
      'content': instance.content,
      'datetime': instance.datetime.toIso8601String(),
      'priority': _$TaskPriorityEnumMap[instance.priority]!,
      'flexible': instance.flexible,
      'duration_minutes': instance.durationMinutes,
    };

const _$TaskTypeEnumMap = {
  TaskType.task: 'task',
  TaskType.reminder: 'reminder',
  TaskType.event: 'event',
};

const _$TaskPriorityEnumMap = {
  TaskPriority.low: 'low',
  TaskPriority.medium: 'medium',
  TaskPriority.high: 'high',
};

_$IntentExtractionResponseImpl _$$IntentExtractionResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$IntentExtractionResponseImpl(
      intents: (json['intents'] as List<dynamic>)
          .map((e) => Intent.fromJson(e as Map<String, dynamic>))
          .toList(),
      rawText: json['raw_text'] as String,
    );

Map<String, dynamic> _$$IntentExtractionResponseImplToJson(
        _$IntentExtractionResponseImpl instance) =>
    <String, dynamic>{
      'intents': instance.intents,
      'raw_text': instance.rawText,
    };
