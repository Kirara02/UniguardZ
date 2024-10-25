// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_field.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TaskField _$TaskFieldFromJson(Map<String, dynamic> json) {
  return _TaskField.fromJson(json);
}

/// @nodoc
mixin _$TaskField {
  int get fieldTypeId => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskFieldCopyWith<TaskField> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskFieldCopyWith<$Res> {
  factory $TaskFieldCopyWith(TaskField value, $Res Function(TaskField) then) =
      _$TaskFieldCopyWithImpl<$Res, TaskField>;
  @useResult
  $Res call({int fieldTypeId, int id, String name, int status});
}

/// @nodoc
class _$TaskFieldCopyWithImpl<$Res, $Val extends TaskField>
    implements $TaskFieldCopyWith<$Res> {
  _$TaskFieldCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fieldTypeId = null,
    Object? id = null,
    Object? name = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      fieldTypeId: null == fieldTypeId
          ? _value.fieldTypeId
          : fieldTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskFieldImplCopyWith<$Res>
    implements $TaskFieldCopyWith<$Res> {
  factory _$$TaskFieldImplCopyWith(
          _$TaskFieldImpl value, $Res Function(_$TaskFieldImpl) then) =
      __$$TaskFieldImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int fieldTypeId, int id, String name, int status});
}

/// @nodoc
class __$$TaskFieldImplCopyWithImpl<$Res>
    extends _$TaskFieldCopyWithImpl<$Res, _$TaskFieldImpl>
    implements _$$TaskFieldImplCopyWith<$Res> {
  __$$TaskFieldImplCopyWithImpl(
      _$TaskFieldImpl _value, $Res Function(_$TaskFieldImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fieldTypeId = null,
    Object? id = null,
    Object? name = null,
    Object? status = null,
  }) {
    return _then(_$TaskFieldImpl(
      fieldTypeId: null == fieldTypeId
          ? _value.fieldTypeId
          : fieldTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskFieldImpl implements _TaskField {
  const _$TaskFieldImpl(
      {required this.fieldTypeId,
      required this.id,
      required this.name,
      required this.status});

  factory _$TaskFieldImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskFieldImplFromJson(json);

  @override
  final int fieldTypeId;
  @override
  final int id;
  @override
  final String name;
  @override
  final int status;

  @override
  String toString() {
    return 'TaskField(fieldTypeId: $fieldTypeId, id: $id, name: $name, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskFieldImpl &&
            (identical(other.fieldTypeId, fieldTypeId) ||
                other.fieldTypeId == fieldTypeId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, fieldTypeId, id, name, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskFieldImplCopyWith<_$TaskFieldImpl> get copyWith =>
      __$$TaskFieldImplCopyWithImpl<_$TaskFieldImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskFieldImplToJson(
      this,
    );
  }
}

abstract class _TaskField implements TaskField {
  const factory _TaskField(
      {required final int fieldTypeId,
      required final int id,
      required final String name,
      required final int status}) = _$TaskFieldImpl;

  factory _TaskField.fromJson(Map<String, dynamic> json) =
      _$TaskFieldImpl.fromJson;

  @override
  int get fieldTypeId;
  @override
  int get id;
  @override
  String get name;
  @override
  int get status;
  @override
  @JsonKey(ignore: true)
  _$$TaskFieldImplCopyWith<_$TaskFieldImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
