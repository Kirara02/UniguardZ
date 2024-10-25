// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      taskFields: (json['TaskFields'] as List<dynamic>)
          .map((e) => TaskField.fromJson(e as Map<String, dynamic>))
          .toList(),
      allowedTime: (json['allowedTime'] as num).toInt(),
      branchId: (json['branchId'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      occurance: (json['occurance'] as num).toInt(),
      startDateTime: DateTime.parse(json['startDateTime'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      validDateTime: DateTime.parse(json['validDateTime'] as String),
    );

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'TaskFields': instance.taskFields,
      'allowedTime': instance.allowedTime,
      'branchId': instance.branchId,
      'createdAt': instance.createdAt.toIso8601String(),
      'occurance': instance.occurance,
      'startDateTime': instance.startDateTime.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'validDateTime': instance.validDateTime.toIso8601String(),
    };
