// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_field.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UFormField _$UFormFieldFromJson(Map<String, dynamic> json) {
  return _UFormField.fromJson(json);
}

/// @nodoc
mixin _$UFormField {
  int get id => throw _privateConstructorUsedError;
  int get formId => throw _privateConstructorUsedError;
  int get fieldTypeId => throw _privateConstructorUsedError;
  bool get isRequire => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;
  int? get pickListId => throw _privateConstructorUsedError;
  @JsonKey(
      name: "FormPickList",
      fromJson: _fromJsonFormPickList,
      toJson: _toJsonFormPickList)
  List<FormPickList>? get formPickList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UFormFieldCopyWith<UFormField> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UFormFieldCopyWith<$Res> {
  factory $UFormFieldCopyWith(
          UFormField value, $Res Function(UFormField) then) =
      _$UFormFieldCopyWithImpl<$Res, UFormField>;
  @useResult
  $Res call(
      {int id,
      int formId,
      int fieldTypeId,
      bool isRequire,
      String name,
      int status,
      int? pickListId,
      @JsonKey(
          name: "FormPickList",
          fromJson: _fromJsonFormPickList,
          toJson: _toJsonFormPickList)
      List<FormPickList>? formPickList});
}

/// @nodoc
class _$UFormFieldCopyWithImpl<$Res, $Val extends UFormField>
    implements $UFormFieldCopyWith<$Res> {
  _$UFormFieldCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? formId = null,
    Object? fieldTypeId = null,
    Object? isRequire = null,
    Object? name = null,
    Object? status = null,
    Object? pickListId = freezed,
    Object? formPickList = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      formId: null == formId
          ? _value.formId
          : formId // ignore: cast_nullable_to_non_nullable
              as int,
      fieldTypeId: null == fieldTypeId
          ? _value.fieldTypeId
          : fieldTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      isRequire: null == isRequire
          ? _value.isRequire
          : isRequire // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      pickListId: freezed == pickListId
          ? _value.pickListId
          : pickListId // ignore: cast_nullable_to_non_nullable
              as int?,
      formPickList: freezed == formPickList
          ? _value.formPickList
          : formPickList // ignore: cast_nullable_to_non_nullable
              as List<FormPickList>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UFormFieldImplCopyWith<$Res>
    implements $UFormFieldCopyWith<$Res> {
  factory _$$UFormFieldImplCopyWith(
          _$UFormFieldImpl value, $Res Function(_$UFormFieldImpl) then) =
      __$$UFormFieldImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int formId,
      int fieldTypeId,
      bool isRequire,
      String name,
      int status,
      int? pickListId,
      @JsonKey(
          name: "FormPickList",
          fromJson: _fromJsonFormPickList,
          toJson: _toJsonFormPickList)
      List<FormPickList>? formPickList});
}

/// @nodoc
class __$$UFormFieldImplCopyWithImpl<$Res>
    extends _$UFormFieldCopyWithImpl<$Res, _$UFormFieldImpl>
    implements _$$UFormFieldImplCopyWith<$Res> {
  __$$UFormFieldImplCopyWithImpl(
      _$UFormFieldImpl _value, $Res Function(_$UFormFieldImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? formId = null,
    Object? fieldTypeId = null,
    Object? isRequire = null,
    Object? name = null,
    Object? status = null,
    Object? pickListId = freezed,
    Object? formPickList = freezed,
  }) {
    return _then(_$UFormFieldImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      formId: null == formId
          ? _value.formId
          : formId // ignore: cast_nullable_to_non_nullable
              as int,
      fieldTypeId: null == fieldTypeId
          ? _value.fieldTypeId
          : fieldTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      isRequire: null == isRequire
          ? _value.isRequire
          : isRequire // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      pickListId: freezed == pickListId
          ? _value.pickListId
          : pickListId // ignore: cast_nullable_to_non_nullable
              as int?,
      formPickList: freezed == formPickList
          ? _value._formPickList
          : formPickList // ignore: cast_nullable_to_non_nullable
              as List<FormPickList>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UFormFieldImpl implements _UFormField {
  _$UFormFieldImpl(
      {required this.id,
      required this.formId,
      required this.fieldTypeId,
      required this.isRequire,
      required this.name,
      required this.status,
      this.pickListId,
      @JsonKey(
          name: "FormPickList",
          fromJson: _fromJsonFormPickList,
          toJson: _toJsonFormPickList)
      final List<FormPickList>? formPickList})
      : _formPickList = formPickList;

  factory _$UFormFieldImpl.fromJson(Map<String, dynamic> json) =>
      _$$UFormFieldImplFromJson(json);

  @override
  final int id;
  @override
  final int formId;
  @override
  final int fieldTypeId;
  @override
  final bool isRequire;
  @override
  final String name;
  @override
  final int status;
  @override
  final int? pickListId;
  final List<FormPickList>? _formPickList;
  @override
  @JsonKey(
      name: "FormPickList",
      fromJson: _fromJsonFormPickList,
      toJson: _toJsonFormPickList)
  List<FormPickList>? get formPickList {
    final value = _formPickList;
    if (value == null) return null;
    if (_formPickList is EqualUnmodifiableListView) return _formPickList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'UFormField(id: $id, formId: $formId, fieldTypeId: $fieldTypeId, isRequire: $isRequire, name: $name, status: $status, pickListId: $pickListId, formPickList: $formPickList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UFormFieldImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.formId, formId) || other.formId == formId) &&
            (identical(other.fieldTypeId, fieldTypeId) ||
                other.fieldTypeId == fieldTypeId) &&
            (identical(other.isRequire, isRequire) ||
                other.isRequire == isRequire) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.pickListId, pickListId) ||
                other.pickListId == pickListId) &&
            const DeepCollectionEquality()
                .equals(other._formPickList, _formPickList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      formId,
      fieldTypeId,
      isRequire,
      name,
      status,
      pickListId,
      const DeepCollectionEquality().hash(_formPickList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UFormFieldImplCopyWith<_$UFormFieldImpl> get copyWith =>
      __$$UFormFieldImplCopyWithImpl<_$UFormFieldImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UFormFieldImplToJson(
      this,
    );
  }
}

abstract class _UFormField implements UFormField {
  factory _UFormField(
      {required final int id,
      required final int formId,
      required final int fieldTypeId,
      required final bool isRequire,
      required final String name,
      required final int status,
      final int? pickListId,
      @JsonKey(
          name: "FormPickList",
          fromJson: _fromJsonFormPickList,
          toJson: _toJsonFormPickList)
      final List<FormPickList>? formPickList}) = _$UFormFieldImpl;

  factory _UFormField.fromJson(Map<String, dynamic> json) =
      _$UFormFieldImpl.fromJson;

  @override
  int get id;
  @override
  int get formId;
  @override
  int get fieldTypeId;
  @override
  bool get isRequire;
  @override
  String get name;
  @override
  int get status;
  @override
  int? get pickListId;
  @override
  @JsonKey(
      name: "FormPickList",
      fromJson: _fromJsonFormPickList,
      toJson: _toJsonFormPickList)
  List<FormPickList>? get formPickList;
  @override
  @JsonKey(ignore: true)
  _$$UFormFieldImplCopyWith<_$UFormFieldImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
