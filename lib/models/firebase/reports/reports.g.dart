// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reports.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReportsImpl _$$ReportsImplFromJson(Map<String, dynamic> json) =>
    _$ReportsImpl(
      holidays: json['holidays'] as Map<String, dynamic>,
      isApproval: json['isApproval'] as bool,
      absentOrLeft: (json['absentOrLeft'] as num).toDouble(),
      projectId: json['projectId'] as String,
      date: TimestampConverter.fromJsonNullable(json['date'] as Timestamp?),
      projects: (json['projects'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      createdAt:
          TimestampConverter.fromJsonNullable(json['createdAt'] as Timestamp?),
      updatedAt:
          TimestampConverter.fromJsonNullable(json['updatedAt'] as Timestamp?),
    );

Map<String, dynamic> _$$ReportsImplToJson(_$ReportsImpl instance) =>
    <String, dynamic>{
      'holidays': instance.holidays,
      'isApproval': instance.isApproval,
      'absentOrLeft': instance.absentOrLeft,
      'projectId': instance.projectId,
      'date': instance.date?.toIso8601String(),
      'projects': instance.projects,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
