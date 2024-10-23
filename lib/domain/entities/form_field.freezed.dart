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

FormField _$FormFieldFromJson(Map<String, dynamic> json) {
  return _FormField.fromJson(json);
}

/// @nodoc
mixin _$FormField {
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
  $FormFieldCopyWith<FormField> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormFieldCopyWith<$Res> {
  factory $FormFieldCopyWith(FormField value, $Res Function(FormField) then) =
      _$FormFieldCopyWithImpl<$Res, FormField>;
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
class _$FormFieldCopyWithImpl<$Res, $Val extends FormField>
    implements $FormFieldCopyWith<$Res> {
  _$FormFieldCopyWithImpl(this._value, this._then);

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
abstract class _$$FormFieldImplCopyWith<$Res>
    implements $FormFieldCopyWith<$Res> {
  factory _$$FormFieldImplCopyWith(
          _$FormFieldImpl value, $Res Function(_$FormFieldImpl) then) =
      __$$FormFieldImplCopyWithImpl<$Res>;
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
class __$$FormFieldImplCopyWithImpl<$Res>
    extends _$FormFieldCopyWithImpl<$Res, _$FormFieldImpl>
    implements _$$FormFieldImplCopyWith<$Res> {
  __$$FormFieldImplCopyWithImpl(
      _$FormFieldImpl _value, $Res Function(_$FormFieldImpl) _then)
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
    return _then(_$FormFieldImpl(
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
class _$FormFieldImpl implements _FormField {
  _$FormFieldImpl(
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

  factory _$FormFieldImpl.fromJson(Map<String, dynamic> json) =>
      _$$FormFieldImplFromJson(json);

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
    return 'FormField(id: $id, formId: $formId, fieldTypeId: $fieldTypeId, isRequire: $isRequire, name: $name, status: $status, pickListId: $pickListId, formPickList: $formPickList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormFieldImpl &&
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
  _$$FormFieldImplCopyWith<_$FormFieldImpl> get copyWith =>
      __$$FormFieldImplCopyWithImpl<_$FormFieldImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FormFieldImplToJson(
      this,
    );
  }
}

abstract class _FormField implements FormField {
  factory _FormField(
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
      final List<FormPickList>? formPickList}) = _$FormFieldImpl;

  factory _FormField.fromJson(Map<String, dynamic> json) =
      _$FormFieldImpl.fromJson;

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
  _$$FormFieldImplCopyWith<_$FormFieldImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
