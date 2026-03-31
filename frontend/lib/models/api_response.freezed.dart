// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HealthResponse _$HealthResponseFromJson(Map<String, dynamic> json) {
  return _HealthResponse.fromJson(json);
}

/// @nodoc
mixin _$HealthResponse {
  String get status => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;

  /// Serializes this HealthResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HealthResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HealthResponseCopyWith<HealthResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HealthResponseCopyWith<$Res> {
  factory $HealthResponseCopyWith(
          HealthResponse value, $Res Function(HealthResponse) then) =
      _$HealthResponseCopyWithImpl<$Res, HealthResponse>;
  @useResult
  $Res call({String status, DateTime timestamp});
}

/// @nodoc
class _$HealthResponseCopyWithImpl<$Res, $Val extends HealthResponse>
    implements $HealthResponseCopyWith<$Res> {
  _$HealthResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HealthResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HealthResponseImplCopyWith<$Res>
    implements $HealthResponseCopyWith<$Res> {
  factory _$$HealthResponseImplCopyWith(_$HealthResponseImpl value,
          $Res Function(_$HealthResponseImpl) then) =
      __$$HealthResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, DateTime timestamp});
}

/// @nodoc
class __$$HealthResponseImplCopyWithImpl<$Res>
    extends _$HealthResponseCopyWithImpl<$Res, _$HealthResponseImpl>
    implements _$$HealthResponseImplCopyWith<$Res> {
  __$$HealthResponseImplCopyWithImpl(
      _$HealthResponseImpl _value, $Res Function(_$HealthResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of HealthResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? timestamp = null,
  }) {
    return _then(_$HealthResponseImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HealthResponseImpl implements _HealthResponse {
  const _$HealthResponseImpl({required this.status, required this.timestamp});

  factory _$HealthResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$HealthResponseImplFromJson(json);

  @override
  final String status;
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'HealthResponse(status: $status, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HealthResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, timestamp);

  /// Create a copy of HealthResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HealthResponseImplCopyWith<_$HealthResponseImpl> get copyWith =>
      __$$HealthResponseImplCopyWithImpl<_$HealthResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HealthResponseImplToJson(
      this,
    );
  }
}

abstract class _HealthResponse implements HealthResponse {
  const factory _HealthResponse(
      {required final String status,
      required final DateTime timestamp}) = _$HealthResponseImpl;

  factory _HealthResponse.fromJson(Map<String, dynamic> json) =
      _$HealthResponseImpl.fromJson;

  @override
  String get status;
  @override
  DateTime get timestamp;

  /// Create a copy of HealthResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HealthResponseImplCopyWith<_$HealthResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TranscriptionResponse _$TranscriptionResponseFromJson(
    Map<String, dynamic> json) {
  return _TranscriptionResponse.fromJson(json);
}

/// @nodoc
mixin _$TranscriptionResponse {
  String get transcription => throw _privateConstructorUsedError;
  double get confidence => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;

  /// Serializes this TranscriptionResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TranscriptionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TranscriptionResponseCopyWith<TranscriptionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TranscriptionResponseCopyWith<$Res> {
  factory $TranscriptionResponseCopyWith(TranscriptionResponse value,
          $Res Function(TranscriptionResponse) then) =
      _$TranscriptionResponseCopyWithImpl<$Res, TranscriptionResponse>;
  @useResult
  $Res call({String transcription, double confidence, DateTime timestamp});
}

/// @nodoc
class _$TranscriptionResponseCopyWithImpl<$Res,
        $Val extends TranscriptionResponse>
    implements $TranscriptionResponseCopyWith<$Res> {
  _$TranscriptionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TranscriptionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transcription = null,
    Object? confidence = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      transcription: null == transcription
          ? _value.transcription
          : transcription // ignore: cast_nullable_to_non_nullable
              as String,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TranscriptionResponseImplCopyWith<$Res>
    implements $TranscriptionResponseCopyWith<$Res> {
  factory _$$TranscriptionResponseImplCopyWith(
          _$TranscriptionResponseImpl value,
          $Res Function(_$TranscriptionResponseImpl) then) =
      __$$TranscriptionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String transcription, double confidence, DateTime timestamp});
}

/// @nodoc
class __$$TranscriptionResponseImplCopyWithImpl<$Res>
    extends _$TranscriptionResponseCopyWithImpl<$Res,
        _$TranscriptionResponseImpl>
    implements _$$TranscriptionResponseImplCopyWith<$Res> {
  __$$TranscriptionResponseImplCopyWithImpl(_$TranscriptionResponseImpl _value,
      $Res Function(_$TranscriptionResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of TranscriptionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transcription = null,
    Object? confidence = null,
    Object? timestamp = null,
  }) {
    return _then(_$TranscriptionResponseImpl(
      transcription: null == transcription
          ? _value.transcription
          : transcription // ignore: cast_nullable_to_non_nullable
              as String,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TranscriptionResponseImpl implements _TranscriptionResponse {
  const _$TranscriptionResponseImpl(
      {required this.transcription,
      required this.confidence,
      required this.timestamp});

  factory _$TranscriptionResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TranscriptionResponseImplFromJson(json);

  @override
  final String transcription;
  @override
  final double confidence;
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'TranscriptionResponse(transcription: $transcription, confidence: $confidence, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TranscriptionResponseImpl &&
            (identical(other.transcription, transcription) ||
                other.transcription == transcription) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, transcription, confidence, timestamp);

  /// Create a copy of TranscriptionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TranscriptionResponseImplCopyWith<_$TranscriptionResponseImpl>
      get copyWith => __$$TranscriptionResponseImplCopyWithImpl<
          _$TranscriptionResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TranscriptionResponseImplToJson(
      this,
    );
  }
}

abstract class _TranscriptionResponse implements TranscriptionResponse {
  const factory _TranscriptionResponse(
      {required final String transcription,
      required final double confidence,
      required final DateTime timestamp}) = _$TranscriptionResponseImpl;

  factory _TranscriptionResponse.fromJson(Map<String, dynamic> json) =
      _$TranscriptionResponseImpl.fromJson;

  @override
  String get transcription;
  @override
  double get confidence;
  @override
  DateTime get timestamp;

  /// Create a copy of TranscriptionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TranscriptionResponseImplCopyWith<_$TranscriptionResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DeleteResponse _$DeleteResponseFromJson(Map<String, dynamic> json) {
  return _DeleteResponse.fromJson(json);
}

/// @nodoc
mixin _$DeleteResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  /// Serializes this DeleteResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeleteResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeleteResponseCopyWith<DeleteResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteResponseCopyWith<$Res> {
  factory $DeleteResponseCopyWith(
          DeleteResponse value, $Res Function(DeleteResponse) then) =
      _$DeleteResponseCopyWithImpl<$Res, DeleteResponse>;
  @useResult
  $Res call({bool success, String message});
}

/// @nodoc
class _$DeleteResponseCopyWithImpl<$Res, $Val extends DeleteResponse>
    implements $DeleteResponseCopyWith<$Res> {
  _$DeleteResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeleteResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeleteResponseImplCopyWith<$Res>
    implements $DeleteResponseCopyWith<$Res> {
  factory _$$DeleteResponseImplCopyWith(_$DeleteResponseImpl value,
          $Res Function(_$DeleteResponseImpl) then) =
      __$$DeleteResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message});
}

/// @nodoc
class __$$DeleteResponseImplCopyWithImpl<$Res>
    extends _$DeleteResponseCopyWithImpl<$Res, _$DeleteResponseImpl>
    implements _$$DeleteResponseImplCopyWith<$Res> {
  __$$DeleteResponseImplCopyWithImpl(
      _$DeleteResponseImpl _value, $Res Function(_$DeleteResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeleteResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
  }) {
    return _then(_$DeleteResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeleteResponseImpl implements _DeleteResponse {
  const _$DeleteResponseImpl({required this.success, required this.message});

  factory _$DeleteResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeleteResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;

  @override
  String toString() {
    return 'DeleteResponse(success: $success, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message);

  /// Create a copy of DeleteResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteResponseImplCopyWith<_$DeleteResponseImpl> get copyWith =>
      __$$DeleteResponseImplCopyWithImpl<_$DeleteResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeleteResponseImplToJson(
      this,
    );
  }
}

abstract class _DeleteResponse implements DeleteResponse {
  const factory _DeleteResponse(
      {required final bool success,
      required final String message}) = _$DeleteResponseImpl;

  factory _DeleteResponse.fromJson(Map<String, dynamic> json) =
      _$DeleteResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;

  /// Create a copy of DeleteResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteResponseImplCopyWith<_$DeleteResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TimelineItem _$TimelineItemFromJson(Map<String, dynamic> json) {
  return _TimelineItem.fromJson(json);
}

/// @nodoc
mixin _$TimelineItem {
  String get id => throw _privateConstructorUsedError;
  String get type =>
      throw _privateConstructorUsedError; // 'task', 'reminder', or 'event'
  String get content => throw _privateConstructorUsedError;
  DateTime get datetime => throw _privateConstructorUsedError;
  String get priority => throw _privateConstructorUsedError;

  /// Serializes this TimelineItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TimelineItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimelineItemCopyWith<TimelineItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimelineItemCopyWith<$Res> {
  factory $TimelineItemCopyWith(
          TimelineItem value, $Res Function(TimelineItem) then) =
      _$TimelineItemCopyWithImpl<$Res, TimelineItem>;
  @useResult
  $Res call(
      {String id,
      String type,
      String content,
      DateTime datetime,
      String priority});
}

/// @nodoc
class _$TimelineItemCopyWithImpl<$Res, $Val extends TimelineItem>
    implements $TimelineItemCopyWith<$Res> {
  _$TimelineItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimelineItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? content = null,
    Object? datetime = null,
    Object? priority = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      datetime: null == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimelineItemImplCopyWith<$Res>
    implements $TimelineItemCopyWith<$Res> {
  factory _$$TimelineItemImplCopyWith(
          _$TimelineItemImpl value, $Res Function(_$TimelineItemImpl) then) =
      __$$TimelineItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String type,
      String content,
      DateTime datetime,
      String priority});
}

/// @nodoc
class __$$TimelineItemImplCopyWithImpl<$Res>
    extends _$TimelineItemCopyWithImpl<$Res, _$TimelineItemImpl>
    implements _$$TimelineItemImplCopyWith<$Res> {
  __$$TimelineItemImplCopyWithImpl(
      _$TimelineItemImpl _value, $Res Function(_$TimelineItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimelineItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? content = null,
    Object? datetime = null,
    Object? priority = null,
  }) {
    return _then(_$TimelineItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      datetime: null == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimelineItemImpl implements _TimelineItem {
  const _$TimelineItemImpl(
      {required this.id,
      required this.type,
      required this.content,
      required this.datetime,
      required this.priority});

  factory _$TimelineItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimelineItemImplFromJson(json);

  @override
  final String id;
  @override
  final String type;
// 'task', 'reminder', or 'event'
  @override
  final String content;
  @override
  final DateTime datetime;
  @override
  final String priority;

  @override
  String toString() {
    return 'TimelineItem(id: $id, type: $type, content: $content, datetime: $datetime, priority: $priority)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimelineItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.datetime, datetime) ||
                other.datetime == datetime) &&
            (identical(other.priority, priority) ||
                other.priority == priority));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, type, content, datetime, priority);

  /// Create a copy of TimelineItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimelineItemImplCopyWith<_$TimelineItemImpl> get copyWith =>
      __$$TimelineItemImplCopyWithImpl<_$TimelineItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimelineItemImplToJson(
      this,
    );
  }
}

abstract class _TimelineItem implements TimelineItem {
  const factory _TimelineItem(
      {required final String id,
      required final String type,
      required final String content,
      required final DateTime datetime,
      required final String priority}) = _$TimelineItemImpl;

  factory _TimelineItem.fromJson(Map<String, dynamic> json) =
      _$TimelineItemImpl.fromJson;

  @override
  String get id;
  @override
  String get type; // 'task', 'reminder', or 'event'
  @override
  String get content;
  @override
  DateTime get datetime;
  @override
  String get priority;

  /// Create a copy of TimelineItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimelineItemImplCopyWith<_$TimelineItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TimelineResponse _$TimelineResponseFromJson(Map<String, dynamic> json) {
  return _TimelineResponse.fromJson(json);
}

/// @nodoc
mixin _$TimelineResponse {
  List<TimelineItem> get items => throw _privateConstructorUsedError;

  /// Serializes this TimelineResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TimelineResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimelineResponseCopyWith<TimelineResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimelineResponseCopyWith<$Res> {
  factory $TimelineResponseCopyWith(
          TimelineResponse value, $Res Function(TimelineResponse) then) =
      _$TimelineResponseCopyWithImpl<$Res, TimelineResponse>;
  @useResult
  $Res call({List<TimelineItem> items});
}

/// @nodoc
class _$TimelineResponseCopyWithImpl<$Res, $Val extends TimelineResponse>
    implements $TimelineResponseCopyWith<$Res> {
  _$TimelineResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimelineResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<TimelineItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimelineResponseImplCopyWith<$Res>
    implements $TimelineResponseCopyWith<$Res> {
  factory _$$TimelineResponseImplCopyWith(_$TimelineResponseImpl value,
          $Res Function(_$TimelineResponseImpl) then) =
      __$$TimelineResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TimelineItem> items});
}

/// @nodoc
class __$$TimelineResponseImplCopyWithImpl<$Res>
    extends _$TimelineResponseCopyWithImpl<$Res, _$TimelineResponseImpl>
    implements _$$TimelineResponseImplCopyWith<$Res> {
  __$$TimelineResponseImplCopyWithImpl(_$TimelineResponseImpl _value,
      $Res Function(_$TimelineResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimelineResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$TimelineResponseImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<TimelineItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimelineResponseImpl implements _TimelineResponse {
  const _$TimelineResponseImpl({required final List<TimelineItem> items})
      : _items = items;

  factory _$TimelineResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimelineResponseImplFromJson(json);

  final List<TimelineItem> _items;
  @override
  List<TimelineItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'TimelineResponse(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimelineResponseImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  /// Create a copy of TimelineResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimelineResponseImplCopyWith<_$TimelineResponseImpl> get copyWith =>
      __$$TimelineResponseImplCopyWithImpl<_$TimelineResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimelineResponseImplToJson(
      this,
    );
  }
}

abstract class _TimelineResponse implements TimelineResponse {
  const factory _TimelineResponse({required final List<TimelineItem> items}) =
      _$TimelineResponseImpl;

  factory _TimelineResponse.fromJson(Map<String, dynamic> json) =
      _$TimelineResponseImpl.fromJson;

  @override
  List<TimelineItem> get items;

  /// Create a copy of TimelineResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimelineResponseImplCopyWith<_$TimelineResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
