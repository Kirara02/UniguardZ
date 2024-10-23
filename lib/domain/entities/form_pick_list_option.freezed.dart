// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_pick_list_option.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FormPickListOption _$FormPickListOptionFromJson(Map<String, dynamic> json) {
  return _FormPickListOption.fromJson(json);
}

/// @nodoc
mixin _$FormPickListOption {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FormPickListOptionCopyWith<FormPickListOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormPickListOptionCopyWith<$Res> {
  factory $FormPickListOptionCopyWith(
          FormPickListOption value, $Res Function(FormPickListOption) then) =
      _$FormPickListOptionCopyWithImpl<$Res, FormPickListOption>;
  @useResult
  $Res call({int id, String name, int status});
}

/// @nodoc
class _$FormPickListOptionCopyWithImpl<$Res, $Val extends FormPickListOption>
    implements $FormPickListOptionCopyWith<$Res> {
  _$FormPickListOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? status = null,
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
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FormPickListOptionImplCopyWith<$Res>
    implements $FormPickListOptionCopyWith<$Res> {
  factory _$$FormPickListOptionImplCopyWith(_$FormPickListOptionImpl value,
          $Res Function(_$FormPickListOptionImpl) then) =
      __$$FormPickListOptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, int status});
}

/// @nodoc
class __$$FormPickListOptionImplCopyWithImpl<$Res>
    extends _$FormPickListOptionCopyWithImpl<$Res, _$FormPickListOptionImpl>
    implements _$$FormPickListOptionImplCopyWith<$Res> {
  __$$FormPickListOptionImplCopyWithImpl(_$FormPickListOptionImpl _value,
      $Res Function(_$FormPickListOptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? status = null,
  }) {
    return _then(_$FormPickListOptionImpl(
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
class _$FormPickListOptionImpl implements _FormPickListOption {
  _$FormPickListOptionImpl(
      {required this.id, required this.name, required this.status});

  factory _$FormPickListOptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$FormPickListOptionImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final int status;

  @override
  String toString() {
    return 'FormPickListOption(id: $id, name: $name, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormPickListOptionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FormPickListOptionImplCopyWith<_$FormPickListOptionImpl> get copyWith =>
      __$$FormPickListOptionImplCopyWithImpl<_$FormPickListOptionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FormPickListOptionImplToJson(
      this,
    );
  }
}

abstract class _FormPickListOption implements FormPickListOption {
  factory _FormPickListOption(
      {required final int id,
      required final String name,
      required final int status}) = _$FormPickListOptionImpl;

  factory _FormPickListOption.fromJson(Map<String, dynamic> json) =
      _$FormPickListOptionImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  int get status;
  @override
  @JsonKey(ignore: true)
  _$$FormPickListOptionImplCopyWith<_$FormPickListOptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
