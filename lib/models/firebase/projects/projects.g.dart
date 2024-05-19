// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projects.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectsImpl _$$ProjectsImplFromJson(Map<String, dynamic> json) =>
    _$ProjectsImpl(
      id: json['id'] as String,
      business: (json['business'] as num).toDouble(),
      over: (json['over'] as num).toDouble(),
      late: (json['late'] as num).toDouble(),
      createdAt:
          TimestampConverter.fromJsonNullable(json['createdAt'] as Timestamp?),
      updatedAt:
          TimestampConverter.fromJsonNullable(json['updatedAt'] as Timestamp?),
    );

Map<String, dynamic> _$$ProjectsImplToJson(_$ProjectsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'business': instance.business,
      'over': instance.over,
      'late': instance.late,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
