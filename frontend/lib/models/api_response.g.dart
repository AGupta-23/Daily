// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HealthResponseImpl _$$HealthResponseImplFromJson(Map<String, dynamic> json) =>
    _$HealthResponseImpl(
      status: json['status'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$HealthResponseImplToJson(
        _$HealthResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'timestamp': instance.timestamp.toIso8601String(),
    };

_$TranscriptionResponseImpl _$$TranscriptionResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$TranscriptionResponseImpl(
      transcription: json['transcription'] as String,
      confidence: (json['confidence'] as num).toDouble(),
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$TranscriptionResponseImplToJson(
        _$TranscriptionResponseImpl instance) =>
    <String, dynamic>{
      'transcription': instance.transcription,
      'confidence': instance.confidence,
      'timestamp': instance.timestamp.toIso8601String(),
    };

_$DeleteResponseImpl _$$DeleteResponseImplFromJson(Map<String, dynamic> json) =>
    _$DeleteResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
    );

Map<String, dynamic> _$$DeleteResponseImplToJson(
        _$DeleteResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
    };

_$TimelineItemImpl _$$TimelineItemImplFromJson(Map<String, dynamic> json) =>
    _$TimelineItemImpl(
      id: json['id'] as String,
      type: json['type'] as String,
      content: json['content'] as String,
      datetime: DateTime.parse(json['datetime'] as String),
      priority: json['priority'] as String,
    );

Map<String, dynamic> _$$TimelineItemImplToJson(_$TimelineItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'content': instance.content,
      'datetime': instance.datetime.toIso8601String(),
      'priority': instance.priority,
    };

_$TimelineResponseImpl _$$TimelineResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$TimelineResponseImpl(
      items: (json['items'] as List<dynamic>)
          .map((e) => TimelineItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TimelineResponseImplToJson(
        _$TimelineResponseImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
