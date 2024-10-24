// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_field.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UFormFieldImpl _$$UFormFieldImplFromJson(Map<String, dynamic> json) =>
    _$UFormFieldImpl(
      id: (json['id'] as num).toInt(),
      formId: (json['formId'] as num).toInt(),
      fieldTypeId: (json['fieldTypeId'] as num).toInt(),
      isRequire: json['isRequire'] as bool,
      name: json['name'] as String,
      status: (json['status'] as num).toInt(),
      pickListId: (json['pickListId'] as num?)?.toInt(),
      formPickList: _fromJsonFormPickList(json['FormPickList']),
    );

Map<String, dynamic> _$$UFormFieldImplToJson(_$UFormFieldImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'formId': instance.formId,
      'fieldTypeId': instance.fieldTypeId,
      'isRequire': instance.isRequire,
      'name': instance.name,
      'status': instance.status,
      'pickListId': instance.pickListId,
      'FormPickList': _toJsonFormPickList(instance.formPickList),
    };
