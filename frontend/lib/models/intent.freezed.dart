// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'intent.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Intent _$IntentFromJson(Map<String, dynamic> json) {
  return _Intent.fromJson(json);
}

/// @nodoc
mixin _$Intent {
  TaskType get type => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DateTime get datetime => throw _privateConstructorUsedError;
  TaskPriority get priority => throw _privateConstructorUsedError;
  bool get flexible => throw _privateConstructorUsedError;
  @JsonKey(name: 'duration_minutes')
  int get durationMinutes => throw _privateConstructorUsedError;

  /// Serializes this Intent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Intent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IntentCopyWith<Intent> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IntentCopyWith<$Res> {
  factory $IntentCopyWith(Intent value, $Res Function(Intent) then) =
      _$IntentCopyWithImpl<$Res, Intent>;
  @useResult
  $Res call(
      {TaskType type,
      String content,
      DateTime datetime,
      TaskPriority priority,
      bool flexible,
      @JsonKey(name: 'duration_minutes') int durationMinutes});
}

/// @nodoc
class _$IntentCopyWithImpl<$Res, $Val extends Intent>
    implements $IntentCopyWith<$Res> {
  _$IntentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Intent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? content = null,
    Object? datetime = null,
    Object? priority = null,
    Object? flexible = null,
    Object? durationMinutes = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TaskType,
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
abstract class _$$IntentImplCopyWith<$Res> implements $IntentCopyWith<$Res> {
  factory _$$IntentImplCopyWith(
          _$IntentImpl value, $Res Function(_$IntentImpl) then) =
      __$$IntentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TaskType type,
      String content,
      DateTime datetime,
      TaskPriority priority,
      bool flexible,
      @JsonKey(name: 'duration_minutes') int durationMinutes});
}

/// @nodoc
class __$$IntentImplCopyWithImpl<$Res>
    extends _$IntentCopyWithImpl<$Res, _$IntentImpl>
    implements _$$IntentImplCopyWith<$Res> {
  __$$IntentImplCopyWithImpl(
      _$IntentImpl _value, $Res Function(_$IntentImpl) _then)
      : super(_value, _then);

  /// Create a copy of Intent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? content = null,
    Object? datetime = null,
    Object? priority = null,
    Object? flexible = null,
    Object? durationMinutes = null,
  }) {
    return _then(_$IntentImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TaskType,
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
class _$IntentImpl implements _Intent {
  const _$IntentImpl(
      {required this.type,
      required this.content,
      required this.datetime,
      required this.priority,
      required this.flexible,
      @JsonKey(name: 'duration_minutes') required this.durationMinutes});

  factory _$IntentImpl.fromJson(Map<String, dynamic> json) =>
      _$$IntentImplFromJson(json);

  @override
  final TaskType type;
  @override
  final String content;
  @override
  final DateTime datetime;
  @override
  final TaskPriority priority;
  @override
  final bool flexible;
  @override
  @JsonKey(name: 'duration_minutes')
  final int durationMinutes;

  @override
  String toString() {
    return 'Intent(type: $type, content: $content, datetime: $datetime, priority: $priority, flexible: $flexible, durationMinutes: $durationMinutes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IntentImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.datetime, datetime) ||
                other.datetime == datetime) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.flexible, flexible) ||
                other.flexible == flexible) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, content, datetime,
      priority, flexible, durationMinutes);

  /// Create a copy of Intent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IntentImplCopyWith<_$IntentImpl> get copyWith =>
      __$$IntentImplCopyWithImpl<_$IntentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IntentImplToJson(
      this,
    );
  }
}

abstract class _Intent implements Intent {
  const factory _Intent(
      {required final TaskType type,
      required final String content,
      required final DateTime datetime,
      required final TaskPriority priority,
      required final bool flexible,
      @JsonKey(name: 'duration_minutes')
      required final int durationMinutes}) = _$IntentImpl;

  factory _Intent.fromJson(Map<String, dynamic> json) = _$IntentImpl.fromJson;

  @override
  TaskType get type;
  @override
  String get content;
  @override
  DateTime get datetime;
  @override
  TaskPriority get priority;
  @override
  bool get flexible;
  @override
  @JsonKey(name: 'duration_minutes')
  int get durationMinutes;

  /// Create a copy of Intent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IntentImplCopyWith<_$IntentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

IntentExtractionResponse _$IntentExtractionResponseFromJson(
    Map<String, dynamic> json) {
  return _IntentExtractionResponse.fromJson(json);
}

/// @nodoc
mixin _$IntentExtractionResponse {
  List<Intent> get intents => throw _privateConstructorUsedError;
  @JsonKey(name: 'raw_text')
  String get rawText => throw _privateConstructorUsedError;

  /// Serializes this IntentExtractionResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IntentExtractionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IntentExtractionResponseCopyWith<IntentExtractionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IntentExtractionResponseCopyWith<$Res> {
  factory $IntentExtractionResponseCopyWith(IntentExtractionResponse value,
          $Res Function(IntentExtractionResponse) then) =
      _$IntentExtractionResponseCopyWithImpl<$Res, IntentExtractionResponse>;
  @useResult
  $Res call({List<Intent> intents, @JsonKey(name: 'raw_text') String rawText});
}

/// @nodoc
class _$IntentExtractionResponseCopyWithImpl<$Res,
        $Val extends IntentExtractionResponse>
    implements $IntentExtractionResponseCopyWith<$Res> {
  _$IntentExtractionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IntentExtractionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? intents = null,
    Object? rawText = null,
  }) {
    return _then(_value.copyWith(
      intents: null == intents
          ? _value.intents
          : intents // ignore: cast_nullable_to_non_nullable
              as List<Intent>,
      rawText: null == rawText
          ? _value.rawText
          : rawText // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IntentExtractionResponseImplCopyWith<$Res>
    implements $IntentExtractionResponseCopyWith<$Res> {
  factory _$$IntentExtractionResponseImplCopyWith(
          _$IntentExtractionResponseImpl value,
          $Res Function(_$IntentExtractionResponseImpl) then) =
      __$$IntentExtractionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Intent> intents, @JsonKey(name: 'raw_text') String rawText});
}

/// @nodoc
class __$$IntentExtractionResponseImplCopyWithImpl<$Res>
    extends _$IntentExtractionResponseCopyWithImpl<$Res,
        _$IntentExtractionResponseImpl>
    implements _$$IntentExtractionResponseImplCopyWith<$Res> {
  __$$IntentExtractionResponseImplCopyWithImpl(
      _$IntentExtractionResponseImpl _value,
      $Res Function(_$IntentExtractionResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of IntentExtractionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? intents = null,
    Object? rawText = null,
  }) {
    return _then(_$IntentExtractionResponseImpl(
      intents: null == intents
          ? _value._intents
          : intents // ignore: cast_nullable_to_non_nullable
              as List<Intent>,
      rawText: null == rawText
          ? _value.rawText
          : rawText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IntentExtractionResponseImpl implements _IntentExtractionResponse {
  const _$IntentExtractionResponseImpl(
      {required final List<Intent> intents,
      @JsonKey(name: 'raw_text') required this.rawText})
      : _intents = intents;

  factory _$IntentExtractionResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$IntentExtractionResponseImplFromJson(json);

  final List<Intent> _intents;
  @override
  List<Intent> get intents {
    if (_intents is EqualUnmodifiableListView) return _intents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_intents);
  }

  @override
  @JsonKey(name: 'raw_text')
  final String rawText;

  @override
  String toString() {
    return 'IntentExtractionResponse(intents: $intents, rawText: $rawText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IntentExtractionResponseImpl &&
            const DeepCollectionEquality().equals(other._intents, _intents) &&
            (identical(other.rawText, rawText) || other.rawText == rawText));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_intents), rawText);

  /// Create a copy of IntentExtractionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IntentExtractionResponseImplCopyWith<_$IntentExtractionResponseImpl>
      get copyWith => __$$IntentExtractionResponseImplCopyWithImpl<
          _$IntentExtractionResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IntentExtractionResponseImplToJson(
      this,
    );
  }
}

abstract class _IntentExtractionResponse implements IntentExtractionResponse {
  const factory _IntentExtractionResponse(
          {required final List<Intent> intents,
          @JsonKey(name: 'raw_text') required final String rawText}) =
      _$IntentExtractionResponseImpl;

  factory _IntentExtractionResponse.fromJson(Map<String, dynamic> json) =
      _$IntentExtractionResponseImpl.fromJson;

  @override
  List<Intent> get intents;
  @override
  @JsonKey(name: 'raw_text')
  String get rawText;

  /// Create a copy of IntentExtractionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IntentExtractionResponseImplCopyWith<_$IntentExtractionResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
