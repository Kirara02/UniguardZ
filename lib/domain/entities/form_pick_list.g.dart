// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_pick_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FormPickListImpl _$$FormPickListImplFromJson(Map<String, dynamic> json) =>
    _$FormPickListImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      status: (json['status'] as num).toInt(),
      formPickListOptions: (json['FormPickListOptions'] as List<dynamic>)
          .map((e) => FormPickListOption.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FormPickListImplToJson(_$FormPickListImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'FormPickListOptions': instance.formPickListOptions,
    };
