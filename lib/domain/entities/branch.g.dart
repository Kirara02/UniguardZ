// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BranchImpl _$$BranchImplFromJson(Map<String, dynamic> json) => _$BranchImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      formFields: (json['FormFields'] as List<dynamic>)
          .map((e) => UFormField.fromJson(e as Map<String, dynamic>))
          .toList(),
      checkPointId: (json['checkPointId'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      roleId: (json['roleId'] as num?)?.toInt(),
      parentBranchId: (json['parentBranchId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$BranchImplToJson(_$BranchImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'FormFields': instance.formFields,
      'checkPointId': instance.checkPointId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'roleId': instance.roleId,
      'parentBranchId': instance.parentBranchId,
    };
