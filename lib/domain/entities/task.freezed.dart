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
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "TaskFields")
  List<TaskField> get taskFields => throw _privateConstructorUsedError;
  int get allowedTime => throw _privateConstructorUsedError;
  int get branchId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  int get occurance => throw _privateConstructorUsedError;
  DateTime get startDateTime => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  DateTime get validDateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res, Task>;
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: "TaskFields") List<TaskField> taskFields,
      int allowedTime,
      int branchId,
      DateTime createdAt,
      int occurance,
      DateTime startDateTime,
      DateTime updatedAt,
      DateTime validDateTime});
}

/// @nodoc
class _$TaskCopyWithImpl<$Res, $Val extends Task>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? taskFields = null,
    Object? allowedTime = null,
    Object? branchId = null,
    Object? createdAt = null,
    Object? occurance = null,
    Object? startDateTime = null,
    Object? updatedAt = null,
    Object? validDateTime = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      taskFields: null == taskFields
          ? _value.taskFields
          : taskFields // ignore: cast_nullable_to_non_nullable
              as List<TaskField>,
      allowedTime: null == allowedTime
          ? _value.allowedTime
          : allowedTime // ignore: cast_nullable_to_non_nullable
              as int,
      branchId: null == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      occurance: null == occurance
          ? _value.occurance
          : occurance // ignore: cast_nullable_to_non_nullable
              as int,
      startDateTime: null == startDateTime
          ? _value.startDateTime
          : startDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      validDateTime: null == validDateTime
          ? _value.validDateTime
          : validDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
      {int id,
      String name,
      @JsonKey(name: "TaskFields") List<TaskField> taskFields,
      int allowedTime,
      int branchId,
      DateTime createdAt,
      int occurance,
      DateTime startDateTime,
      DateTime updatedAt,
      DateTime validDateTime});
}

/// @nodoc
class __$$TaskImplCopyWithImpl<$Res>
    extends _$TaskCopyWithImpl<$Res, _$TaskImpl>
    implements _$$TaskImplCopyWith<$Res> {
  __$$TaskImplCopyWithImpl(_$TaskImpl _value, $Res Function(_$TaskImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? taskFields = null,
    Object? allowedTime = null,
    Object? branchId = null,
    Object? createdAt = null,
    Object? occurance = null,
    Object? startDateTime = null,
    Object? updatedAt = null,
    Object? validDateTime = null,
  }) {
    return _then(_$TaskImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      taskFields: null == taskFields
          ? _value._taskFields
          : taskFields // ignore: cast_nullable_to_non_nullable
              as List<TaskField>,
      allowedTime: null == allowedTime
          ? _value.allowedTime
          : allowedTime // ignore: cast_nullable_to_non_nullable
              as int,
      branchId: null == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      occurance: null == occurance
          ? _value.occurance
          : occurance // ignore: cast_nullable_to_non_nullable
              as int,
      startDateTime: null == startDateTime
          ? _value.startDateTime
          : startDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      validDateTime: null == validDateTime
          ? _value.validDateTime
          : validDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskImpl implements _Task {
  _$TaskImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: "TaskFields") required final List<TaskField> taskFields,
      required this.allowedTime,
      required this.branchId,
      required this.createdAt,
      required this.occurance,
      required this.startDateTime,
      required this.updatedAt,
      required this.validDateTime})
      : _taskFields = taskFields;

  factory _$TaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  final List<TaskField> _taskFields;
  @override
  @JsonKey(name: "TaskFields")
  List<TaskField> get taskFields {
    if (_taskFields is EqualUnmodifiableListView) return _taskFields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_taskFields);
  }

  @override
  final int allowedTime;
  @override
  final int branchId;
  @override
  final DateTime createdAt;
  @override
  final int occurance;
  @override
  final DateTime startDateTime;
  @override
  final DateTime updatedAt;
  @override
  final DateTime validDateTime;

  @override
  String toString() {
    return 'Task(id: $id, name: $name, taskFields: $taskFields, allowedTime: $allowedTime, branchId: $branchId, createdAt: $createdAt, occurance: $occurance, startDateTime: $startDateTime, updatedAt: $updatedAt, validDateTime: $validDateTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._taskFields, _taskFields) &&
            (identical(other.allowedTime, allowedTime) ||
                other.allowedTime == allowedTime) &&
            (identical(other.branchId, branchId) ||
                other.branchId == branchId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.occurance, occurance) ||
                other.occurance == occurance) &&
            (identical(other.startDateTime, startDateTime) ||
                other.startDateTime == startDateTime) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.validDateTime, validDateTime) ||
                other.validDateTime == validDateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      const DeepCollectionEquality().hash(_taskFields),
      allowedTime,
      branchId,
      createdAt,
      occurance,
      startDateTime,
      updatedAt,
      validDateTime);

  @JsonKey(ignore: true)
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
  factory _Task(
      {required final int id,
      required final String name,
      @JsonKey(name: "TaskFields") required final List<TaskField> taskFields,
      required final int allowedTime,
      required final int branchId,
      required final DateTime createdAt,
      required final int occurance,
      required final DateTime startDateTime,
      required final DateTime updatedAt,
      required final DateTime validDateTime}) = _$TaskImpl;

  factory _Task.fromJson(Map<String, dynamic> json) = _$TaskImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: "TaskFields")
  List<TaskField> get taskFields;
  @override
  int get allowedTime;
  @override
  int get branchId;
  @override
  DateTime get createdAt;
  @override
  int get occurance;
  @override
  DateTime get startDateTime;
  @override
  DateTime get updatedAt;
  @override
  DateTime get validDateTime;
  @override
  @JsonKey(ignore: true)
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
