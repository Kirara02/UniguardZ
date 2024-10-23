// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_pick_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FormPickList _$FormPickListFromJson(Map<String, dynamic> json) {
  return _FormPickList.fromJson(json);
}

/// @nodoc
mixin _$FormPickList {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;
  @JsonKey(name: "FormPickListOptions")
  List<FormPickListOption> get formPickListOptions =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FormPickListCopyWith<FormPickList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormPickListCopyWith<$Res> {
  factory $FormPickListCopyWith(
          FormPickList value, $Res Function(FormPickList) then) =
      _$FormPickListCopyWithImpl<$Res, FormPickList>;
  @useResult
  $Res call(
      {int id,
      String name,
      int status,
      @JsonKey(name: "FormPickListOptions")
      List<FormPickListOption> formPickListOptions});
}

/// @nodoc
class _$FormPickListCopyWithImpl<$Res, $Val extends FormPickList>
    implements $FormPickListCopyWith<$Res> {
  _$FormPickListCopyWithImpl(this._value, this._then);

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
    Object? formPickListOptions = null,
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
      formPickListOptions: null == formPickListOptions
          ? _value.formPickListOptions
          : formPickListOptions // ignore: cast_nullable_to_non_nullable
              as List<FormPickListOption>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FormPickListImplCopyWith<$Res>
    implements $FormPickListCopyWith<$Res> {
  factory _$$FormPickListImplCopyWith(
          _$FormPickListImpl value, $Res Function(_$FormPickListImpl) then) =
      __$$FormPickListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      int status,
      @JsonKey(name: "FormPickListOptions")
      List<FormPickListOption> formPickListOptions});
}

/// @nodoc
class __$$FormPickListImplCopyWithImpl<$Res>
    extends _$FormPickListCopyWithImpl<$Res, _$FormPickListImpl>
    implements _$$FormPickListImplCopyWith<$Res> {
  __$$FormPickListImplCopyWithImpl(
      _$FormPickListImpl _value, $Res Function(_$FormPickListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? status = null,
    Object? formPickListOptions = null,
  }) {
    return _then(_$FormPickListImpl(
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
      formPickListOptions: null == formPickListOptions
          ? _value._formPickListOptions
          : formPickListOptions // ignore: cast_nullable_to_non_nullable
              as List<FormPickListOption>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FormPickListImpl implements _FormPickList {
  _$FormPickListImpl(
      {required this.id,
      required this.name,
      required this.status,
      @JsonKey(name: "FormPickListOptions")
      required final List<FormPickListOption> formPickListOptions})
      : _formPickListOptions = formPickListOptions;

  factory _$FormPickListImpl.fromJson(Map<String, dynamic> json) =>
      _$$FormPickListImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final int status;
  final List<FormPickListOption> _formPickListOptions;
  @override
  @JsonKey(name: "FormPickListOptions")
  List<FormPickListOption> get formPickListOptions {
    if (_formPickListOptions is EqualUnmodifiableListView)
      return _formPickListOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_formPickListOptions);
  }

  @override
  String toString() {
    return 'FormPickList(id: $id, name: $name, status: $status, formPickListOptions: $formPickListOptions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormPickListImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._formPickListOptions, _formPickListOptions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, status,
      const DeepCollectionEquality().hash(_formPickListOptions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FormPickListImplCopyWith<_$FormPickListImpl> get copyWith =>
      __$$FormPickListImplCopyWithImpl<_$FormPickListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FormPickListImplToJson(
      this,
    );
  }
}

abstract class _FormPickList implements FormPickList {
  factory _FormPickList(
          {required final int id,
          required final String name,
          required final int status,
          @JsonKey(name: "FormPickListOptions")
          required final List<FormPickListOption> formPickListOptions}) =
      _$FormPickListImpl;

  factory _FormPickList.fromJson(Map<String, dynamic> json) =
      _$FormPickListImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  int get status;
  @override
  @JsonKey(name: "FormPickListOptions")
  List<FormPickListOption> get formPickListOptions;
  @override
  @JsonKey(ignore: true)
  _$$FormPickListImplCopyWith<_$FormPickListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
