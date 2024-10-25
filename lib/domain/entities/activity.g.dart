// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActivityImpl _$$ActivityImplFromJson(Map<String, dynamic> json) =>
    _$ActivityImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      isGps: json['isGPS'] as bool,
      isPhoto: json['isPhoto'] as bool,
      comments: json['comments'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$ActivityImplToJson(_$ActivityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isGPS': instance.isGps,
      'isPhoto': instance.isPhoto,
      'comments': instance.comments,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
