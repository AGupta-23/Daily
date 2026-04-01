// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reminder.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Reminder _$ReminderFromJson(Map<String, dynamic> json) {
  return _Reminder.fromJson(json);
}

/// @nodoc
mixin _$Reminder {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'task_id')
  String get taskId => throw _privateConstructorUsedError;
  @JsonKey(name: 'remind_at')
  DateTime get remindAt => throw _privateConstructorUsedError;
  ReminderType get type => throw _privateConstructorUsedError;
  ReminderStatus get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'task_content')
  String? get taskContent => throw _privateConstructorUsedError;
  @JsonKey(name: 'snoozed_until')
  DateTime? get snoozedUntil => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this Reminder to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Reminder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReminderCopyWith<Reminder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReminderCopyWith<$Res> {
  factory $ReminderCopyWith(Reminder value, $Res Function(Reminder) then) =
      _$ReminderCopyWithImpl<$Res, Reminder>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'task_id') String taskId,
      @JsonKey(name: 'remind_at') DateTime remindAt,
      ReminderType type,
      ReminderStatus status,
      String message,
      @JsonKey(name: 'task_content') String? taskContent,
      @JsonKey(name: 'snoozed_until') DateTime? snoozedUntil,
      @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class _$ReminderCopyWithImpl<$Res, $Val extends Reminder>
    implements $ReminderCopyWith<$Res> {
  _$ReminderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Reminder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? taskId = null,
    Object? remindAt = null,
    Object? type = null,
    Object? status = null,
    Object? message = null,
    Object? taskContent = freezed,
    Object? snoozedUntil = freezed,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
      remindAt: null == remindAt
          ? _value.remindAt
          : remindAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ReminderType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ReminderStatus,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      taskContent: freezed == taskContent
          ? _value.taskContent
          : taskContent // ignore: cast_nullable_to_non_nullable
              as String?,
      snoozedUntil: freezed == snoozedUntil
          ? _value.snoozedUntil
          : snoozedUntil // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReminderImplCopyWith<$Res>
    implements $ReminderCopyWith<$Res> {
  factory _$$ReminderImplCopyWith(
          _$ReminderImpl value, $Res Function(_$ReminderImpl) then) =
      __$$ReminderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'task_id') String taskId,
      @JsonKey(name: 'remind_at') DateTime remindAt,
      ReminderType type,
      ReminderStatus status,
      String message,
      @JsonKey(name: 'task_content') String? taskContent,
      @JsonKey(name: 'snoozed_until') DateTime? snoozedUntil,
      @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class __$$ReminderImplCopyWithImpl<$Res>
    extends _$ReminderCopyWithImpl<$Res, _$ReminderImpl>
    implements _$$ReminderImplCopyWith<$Res> {
  __$$ReminderImplCopyWithImpl(
      _$ReminderImpl _value, $Res Function(_$ReminderImpl) _then)
      : super(_value, _then);

  /// Create a copy of Reminder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? taskId = null,
    Object? remindAt = null,
    Object? type = null,
    Object? status = null,
    Object? message = null,
    Object? taskContent = freezed,
    Object? snoozedUntil = freezed,
    Object? createdAt = null,
  }) {
    return _then(_$ReminderImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
      remindAt: null == remindAt
          ? _value.remindAt
          : remindAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ReminderType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ReminderStatus,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      taskContent: freezed == taskContent
          ? _value.taskContent
          : taskContent // ignore: cast_nullable_to_non_nullable
              as String?,
      snoozedUntil: freezed == snoozedUntil
          ? _value.snoozedUntil
          : snoozedUntil // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReminderImpl implements _Reminder {
  const _$ReminderImpl(
      {required this.id,
      @JsonKey(name: 'task_id') required this.taskId,
      @JsonKey(name: 'remind_at') required this.remindAt,
      required this.type,
      required this.status,
      required this.message,
      @JsonKey(name: 'task_content') this.taskContent,
      @JsonKey(name: 'snoozed_until') this.snoozedUntil,
      @JsonKey(name: 'created_at') required this.createdAt});

  factory _$ReminderImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReminderImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'task_id')
  final String taskId;
  @override
  @JsonKey(name: 'remind_at')
  final DateTime remindAt;
  @override
  final ReminderType type;
  @override
  final ReminderStatus status;
  @override
  final String message;
  @override
  @JsonKey(name: 'task_content')
  final String? taskContent;
  @override
  @JsonKey(name: 'snoozed_until')
  final DateTime? snoozedUntil;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @override
  String toString() {
    return 'Reminder(id: $id, taskId: $taskId, remindAt: $remindAt, type: $type, status: $status, message: $message, taskContent: $taskContent, snoozedUntil: $snoozedUntil, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReminderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.remindAt, remindAt) ||
                other.remindAt == remindAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.taskContent, taskContent) ||
                other.taskContent == taskContent) &&
            (identical(other.snoozedUntil, snoozedUntil) ||
                other.snoozedUntil == snoozedUntil) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, taskId, remindAt, type,
      status, message, taskContent, snoozedUntil, createdAt);

  /// Create a copy of Reminder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReminderImplCopyWith<_$ReminderImpl> get copyWith =>
      __$$ReminderImplCopyWithImpl<_$ReminderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReminderImplToJson(
      this,
    );
  }
}

abstract class _Reminder implements Reminder {
  const factory _Reminder(
          {required final String id,
          @JsonKey(name: 'task_id') required final String taskId,
          @JsonKey(name: 'remind_at') required final DateTime remindAt,
          required final ReminderType type,
          required final ReminderStatus status,
          required final String message,
          @JsonKey(name: 'task_content') final String? taskContent,
          @JsonKey(name: 'snoozed_until') final DateTime? snoozedUntil,
          @JsonKey(name: 'created_at') required final DateTime createdAt}) =
      _$ReminderImpl;

  factory _Reminder.fromJson(Map<String, dynamic> json) =
      _$ReminderImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'task_id')
  String get taskId;
  @override
  @JsonKey(name: 'remind_at')
  DateTime get remindAt;
  @override
  ReminderType get type;
  @override
  ReminderStatus get status;
  @override
  String get message;
  @override
  @JsonKey(name: 'task_content')
  String? get taskContent;
  @override
  @JsonKey(name: 'snoozed_until')
  DateTime? get snoozedUntil;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;

  /// Create a copy of Reminder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReminderImplCopyWith<_$ReminderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReminderRequest _$ReminderRequestFromJson(Map<String, dynamic> json) {
  return _ReminderRequest.fromJson(json);
}

/// @nodoc
mixin _$ReminderRequest {
  @JsonKey(name: 'task_id')
  String get taskId => throw _privateConstructorUsedError;
  @JsonKey(name: 'remind_at')
  DateTime get remindAt => throw _privateConstructorUsedError;
  ReminderType get type => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  /// Serializes this ReminderRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReminderRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReminderRequestCopyWith<ReminderRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReminderRequestCopyWith<$Res> {
  factory $ReminderRequestCopyWith(
          ReminderRequest value, $Res Function(ReminderRequest) then) =
      _$ReminderRequestCopyWithImpl<$Res, ReminderRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'task_id') String taskId,
      @JsonKey(name: 'remind_at') DateTime remindAt,
      ReminderType type,
      String message});
}

/// @nodoc
class _$ReminderRequestCopyWithImpl<$Res, $Val extends ReminderRequest>
    implements $ReminderRequestCopyWith<$Res> {
  _$ReminderRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReminderRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = null,
    Object? remindAt = null,
    Object? type = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
      remindAt: null == remindAt
          ? _value.remindAt
          : remindAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ReminderType,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReminderRequestImplCopyWith<$Res>
    implements $ReminderRequestCopyWith<$Res> {
  factory _$$ReminderRequestImplCopyWith(_$ReminderRequestImpl value,
          $Res Function(_$ReminderRequestImpl) then) =
      __$$ReminderRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'task_id') String taskId,
      @JsonKey(name: 'remind_at') DateTime remindAt,
      ReminderType type,
      String message});
}

/// @nodoc
class __$$ReminderRequestImplCopyWithImpl<$Res>
    extends _$ReminderRequestCopyWithImpl<$Res, _$ReminderRequestImpl>
    implements _$$ReminderRequestImplCopyWith<$Res> {
  __$$ReminderRequestImplCopyWithImpl(
      _$ReminderRequestImpl _value, $Res Function(_$ReminderRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReminderRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = null,
    Object? remindAt = null,
    Object? type = null,
    Object? message = null,
  }) {
    return _then(_$ReminderRequestImpl(
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
      remindAt: null == remindAt
          ? _value.remindAt
          : remindAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ReminderType,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReminderRequestImpl implements _ReminderRequest {
  const _$ReminderRequestImpl(
      {@JsonKey(name: 'task_id') required this.taskId,
      @JsonKey(name: 'remind_at') required this.remindAt,
      required this.type,
      required this.message});

  factory _$ReminderRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReminderRequestImplFromJson(json);

  @override
  @JsonKey(name: 'task_id')
  final String taskId;
  @override
  @JsonKey(name: 'remind_at')
  final DateTime remindAt;
  @override
  final ReminderType type;
  @override
  final String message;

  @override
  String toString() {
    return 'ReminderRequest(taskId: $taskId, remindAt: $remindAt, type: $type, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReminderRequestImpl &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.remindAt, remindAt) ||
                other.remindAt == remindAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, taskId, remindAt, type, message);

  /// Create a copy of ReminderRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReminderRequestImplCopyWith<_$ReminderRequestImpl> get copyWith =>
      __$$ReminderRequestImplCopyWithImpl<_$ReminderRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReminderRequestImplToJson(
      this,
    );
  }
}

abstract class _ReminderRequest implements ReminderRequest {
  const factory _ReminderRequest(
      {@JsonKey(name: 'task_id') required final String taskId,
      @JsonKey(name: 'remind_at') required final DateTime remindAt,
      required final ReminderType type,
      required final String message}) = _$ReminderRequestImpl;

  factory _ReminderRequest.fromJson(Map<String, dynamic> json) =
      _$ReminderRequestImpl.fromJson;

  @override
  @JsonKey(name: 'task_id')
  String get taskId;
  @override
  @JsonKey(name: 'remind_at')
  DateTime get remindAt;
  @override
  ReminderType get type;
  @override
  String get message;

  /// Create a copy of ReminderRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReminderRequestImplCopyWith<_$ReminderRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SnoozeRequest _$SnoozeRequestFromJson(Map<String, dynamic> json) {
  return _SnoozeRequest.fromJson(json);
}

/// @nodoc
mixin _$SnoozeRequest {
  @JsonKey(name: 'snooze_duration_minutes')
  int get snoozeDurationMinutes => throw _privateConstructorUsedError;

  /// Serializes this SnoozeRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SnoozeRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SnoozeRequestCopyWith<SnoozeRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SnoozeRequestCopyWith<$Res> {
  factory $SnoozeRequestCopyWith(
          SnoozeRequest value, $Res Function(SnoozeRequest) then) =
      _$SnoozeRequestCopyWithImpl<$Res, SnoozeRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'snooze_duration_minutes') int snoozeDurationMinutes});
}

/// @nodoc
class _$SnoozeRequestCopyWithImpl<$Res, $Val extends SnoozeRequest>
    implements $SnoozeRequestCopyWith<$Res> {
  _$SnoozeRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SnoozeRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? snoozeDurationMinutes = null,
  }) {
    return _then(_value.copyWith(
      snoozeDurationMinutes: null == snoozeDurationMinutes
          ? _value.snoozeDurationMinutes
          : snoozeDurationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SnoozeRequestImplCopyWith<$Res>
    implements $SnoozeRequestCopyWith<$Res> {
  factory _$$SnoozeRequestImplCopyWith(
          _$SnoozeRequestImpl value, $Res Function(_$SnoozeRequestImpl) then) =
      __$$SnoozeRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'snooze_duration_minutes') int snoozeDurationMinutes});
}

/// @nodoc
class __$$SnoozeRequestImplCopyWithImpl<$Res>
    extends _$SnoozeRequestCopyWithImpl<$Res, _$SnoozeRequestImpl>
    implements _$$SnoozeRequestImplCopyWith<$Res> {
  __$$SnoozeRequestImplCopyWithImpl(
      _$SnoozeRequestImpl _value, $Res Function(_$SnoozeRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of SnoozeRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? snoozeDurationMinutes = null,
  }) {
    return _then(_$SnoozeRequestImpl(
      snoozeDurationMinutes: null == snoozeDurationMinutes
          ? _value.snoozeDurationMinutes
          : snoozeDurationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SnoozeRequestImpl implements _SnoozeRequest {
  const _$SnoozeRequestImpl(
      {@JsonKey(name: 'snooze_duration_minutes')
      required this.snoozeDurationMinutes});

  factory _$SnoozeRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$SnoozeRequestImplFromJson(json);

  @override
  @JsonKey(name: 'snooze_duration_minutes')
  final int snoozeDurationMinutes;

  @override
  String toString() {
    return 'SnoozeRequest(snoozeDurationMinutes: $snoozeDurationMinutes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SnoozeRequestImpl &&
            (identical(other.snoozeDurationMinutes, snoozeDurationMinutes) ||
                other.snoozeDurationMinutes == snoozeDurationMinutes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, snoozeDurationMinutes);

  /// Create a copy of SnoozeRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SnoozeRequestImplCopyWith<_$SnoozeRequestImpl> get copyWith =>
      __$$SnoozeRequestImplCopyWithImpl<_$SnoozeRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SnoozeRequestImplToJson(
      this,
    );
  }
}

abstract class _SnoozeRequest implements SnoozeRequest {
  const factory _SnoozeRequest(
      {@JsonKey(name: 'snooze_duration_minutes')
      required final int snoozeDurationMinutes}) = _$SnoozeRequestImpl;

  factory _SnoozeRequest.fromJson(Map<String, dynamic> json) =
      _$SnoozeRequestImpl.fromJson;

  @override
  @JsonKey(name: 'snooze_duration_minutes')
  int get snoozeDurationMinutes;

  /// Create a copy of SnoozeRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SnoozeRequestImplCopyWith<_$SnoozeRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
