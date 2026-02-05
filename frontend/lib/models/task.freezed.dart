// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Task _$TaskFromJson(Map<String, dynamic> json) {
  return _Task.fromJson(json);
}

/// @nodoc
mixin _$Task {
  String get id => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DateTime get datetime => throw _privateConstructorUsedError;
  TaskPriority get priority => throw _privateConstructorUsedError;
  TaskType get type => throw _privateConstructorUsedError;
  TaskStatus get status => throw _privateConstructorUsedError;
  bool get flexible => throw _privateConstructorUsedError;
  @JsonKey(name: 'duration_minutes')
  int get durationMinutes => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Task to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res, Task>;
  @useResult
  $Res call(
      {String id,
      String content,
      DateTime datetime,
      TaskPriority priority,
      TaskType type,
      TaskStatus status,
      bool flexible,
      @JsonKey(name: 'duration_minutes') int durationMinutes,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class _$TaskCopyWithImpl<$Res, $Val extends Task>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? datetime = null,
    Object? priority = null,
    Object? type = null,
    Object? status = null,
    Object? flexible = null,
    Object? durationMinutes = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
              as TaskPriority,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TaskType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TaskStatus,
      flexible: null == flexible
          ? _value.flexible
          : flexible // ignore: cast_nullable_to_non_nullable
              as bool,
      durationMinutes: null == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskImplCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$TaskImplCopyWith(
          _$TaskImpl value, $Res Function(_$TaskImpl) then) =
      __$$TaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String content,
      DateTime datetime,
      TaskPriority priority,
      TaskType type,
      TaskStatus status,
      bool flexible,
      @JsonKey(name: 'duration_minutes') int durationMinutes,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class __$$TaskImplCopyWithImpl<$Res>
    extends _$TaskCopyWithImpl<$Res, _$TaskImpl>
    implements _$$TaskImplCopyWith<$Res> {
  __$$TaskImplCopyWithImpl(_$TaskImpl _value, $Res Function(_$TaskImpl) _then)
      : super(_value, _then);

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? datetime = null,
    Object? priority = null,
    Object? type = null,
    Object? status = null,
    Object? flexible = null,
    Object? durationMinutes = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_$TaskImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
              as TaskPriority,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TaskType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TaskStatus,
      flexible: null == flexible
          ? _value.flexible
          : flexible // ignore: cast_nullable_to_non_nullable
              as bool,
      durationMinutes: null == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskImpl implements _Task {
  const _$TaskImpl(
      {required this.id,
      required this.content,
      required this.datetime,
      required this.priority,
      required this.type,
      required this.status,
      required this.flexible,
      @JsonKey(name: 'duration_minutes') required this.durationMinutes,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$TaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskImplFromJson(json);

  @override
  final String id;
  @override
  final String content;
  @override
  final DateTime datetime;
  @override
  final TaskPriority priority;
  @override
  final TaskType type;
  @override
  final TaskStatus status;
  @override
  final bool flexible;
  @override
  @JsonKey(name: 'duration_minutes')
  final int durationMinutes;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Task(id: $id, content: $content, datetime: $datetime, priority: $priority, type: $type, status: $status, flexible: $flexible, durationMinutes: $durationMinutes, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.datetime, datetime) ||
                other.datetime == datetime) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.flexible, flexible) ||
                other.flexible == flexible) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, content, datetime, priority,
      type, status, flexible, durationMinutes, createdAt, updatedAt);

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      __$$TaskImplCopyWithImpl<_$TaskImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskImplToJson(
      this,
    );
  }
}

abstract class _Task implements Task {
  const factory _Task(
      {required final String id,
      required final String content,
      required final DateTime datetime,
      required final TaskPriority priority,
      required final TaskType type,
      required final TaskStatus status,
      required final bool flexible,
      @JsonKey(name: 'duration_minutes') required final int durationMinutes,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'updated_at') final DateTime? updatedAt}) = _$TaskImpl;

  factory _Task.fromJson(Map<String, dynamic> json) = _$TaskImpl.fromJson;

  @override
  String get id;
  @override
  String get content;
  @override
  DateTime get datetime;
  @override
  TaskPriority get priority;
  @override
  TaskType get type;
  @override
  TaskStatus get status;
  @override
  bool get flexible;
  @override
  @JsonKey(name: 'duration_minutes')
  int get durationMinutes;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TaskRequest _$TaskRequestFromJson(Map<String, dynamic> json) {
  return _TaskRequest.fromJson(json);
}

/// @nodoc
mixin _$TaskRequest {
  String get content => throw _privateConstructorUsedError;
  DateTime get datetime => throw _privateConstructorUsedError;
  TaskPriority get priority => throw _privateConstructorUsedError;
  TaskType get type => throw _privateConstructorUsedError;
  bool get flexible => throw _privateConstructorUsedError;
  @JsonKey(name: 'duration_minutes')
  int get durationMinutes => throw _privateConstructorUsedError;

  /// Serializes this TaskRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TaskRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskRequestCopyWith<TaskRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskRequestCopyWith<$Res> {
  factory $TaskRequestCopyWith(
          TaskRequest value, $Res Function(TaskRequest) then) =
      _$TaskRequestCopyWithImpl<$Res, TaskRequest>;
  @useResult
  $Res call(
      {String content,
      DateTime datetime,
      TaskPriority priority,
      TaskType type,
      bool flexible,
      @JsonKey(name: 'duration_minutes') int durationMinutes});
}

/// @nodoc
class _$TaskRequestCopyWithImpl<$Res, $Val extends TaskRequest>
    implements $TaskRequestCopyWith<$Res> {
  _$TaskRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? datetime = null,
    Object? priority = null,
    Object? type = null,
    Object? flexible = null,
    Object? durationMinutes = null,
  }) {
    return _then(_value.copyWith(
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
              as TaskPriority,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TaskType,
      flexible: null == flexible
          ? _value.flexible
          : flexible // ignore: cast_nullable_to_non_nullable
              as bool,
      durationMinutes: null == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskRequestImplCopyWith<$Res>
    implements $TaskRequestCopyWith<$Res> {
  factory _$$TaskRequestImplCopyWith(
          _$TaskRequestImpl value, $Res Function(_$TaskRequestImpl) then) =
      __$$TaskRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String content,
      DateTime datetime,
      TaskPriority priority,
      TaskType type,
      bool flexible,
      @JsonKey(name: 'duration_minutes') int durationMinutes});
}

/// @nodoc
class __$$TaskRequestImplCopyWithImpl<$Res>
    extends _$TaskRequestCopyWithImpl<$Res, _$TaskRequestImpl>
    implements _$$TaskRequestImplCopyWith<$Res> {
  __$$TaskRequestImplCopyWithImpl(
      _$TaskRequestImpl _value, $Res Function(_$TaskRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? datetime = null,
    Object? priority = null,
    Object? type = null,
    Object? flexible = null,
    Object? durationMinutes = null,
  }) {
    return _then(_$TaskRequestImpl(
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
              as TaskPriority,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TaskType,
      flexible: null == flexible
          ? _value.flexible
          : flexible // ignore: cast_nullable_to_non_nullable
              as bool,
      durationMinutes: null == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskRequestImpl implements _TaskRequest {
  const _$TaskRequestImpl(
      {required this.content,
      required this.datetime,
      required this.priority,
      required this.type,
      required this.flexible,
      @JsonKey(name: 'duration_minutes') required this.durationMinutes});

  factory _$TaskRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskRequestImplFromJson(json);

  @override
  final String content;
  @override
  final DateTime datetime;
  @override
  final TaskPriority priority;
  @override
  final TaskType type;
  @override
  final bool flexible;
  @override
  @JsonKey(name: 'duration_minutes')
  final int durationMinutes;

  @override
  String toString() {
    return 'TaskRequest(content: $content, datetime: $datetime, priority: $priority, type: $type, flexible: $flexible, durationMinutes: $durationMinutes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskRequestImpl &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.datetime, datetime) ||
                other.datetime == datetime) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.flexible, flexible) ||
                other.flexible == flexible) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, content, datetime, priority,
      type, flexible, durationMinutes);

  /// Create a copy of TaskRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskRequestImplCopyWith<_$TaskRequestImpl> get copyWith =>
      __$$TaskRequestImplCopyWithImpl<_$TaskRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskRequestImplToJson(
      this,
    );
  }
}

abstract class _TaskRequest implements TaskRequest {
  const factory _TaskRequest(
      {required final String content,
      required final DateTime datetime,
      required final TaskPriority priority,
      required final TaskType type,
      required final bool flexible,
      @JsonKey(name: 'duration_minutes')
      required final int durationMinutes}) = _$TaskRequestImpl;

  factory _TaskRequest.fromJson(Map<String, dynamic> json) =
      _$TaskRequestImpl.fromJson;

  @override
  String get content;
  @override
  DateTime get datetime;
  @override
  TaskPriority get priority;
  @override
  TaskType get type;
  @override
  bool get flexible;
  @override
  @JsonKey(name: 'duration_minutes')
  int get durationMinutes;

  /// Create a copy of TaskRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskRequestImplCopyWith<_$TaskRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
