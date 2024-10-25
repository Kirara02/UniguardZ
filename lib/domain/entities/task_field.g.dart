// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_field.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskFieldImpl _$$TaskFieldImplFromJson(Map<String, dynamic> json) =>
    _$TaskFieldImpl(
      fieldTypeId: (json['fieldTypeId'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      status: (json['status'] as num).toInt(),
    );

Map<String, dynamic> _$$TaskFieldImplToJson(_$TaskFieldImpl instance) =>
    <String, dynamic>{
      'fieldTypeId': instance.fieldTypeId,
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
    };
