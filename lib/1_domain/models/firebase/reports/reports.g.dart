// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reports.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReportsImpl _$$ReportsImplFromJson(Map<String, dynamic> json) =>
    _$ReportsImpl(
      docId: json['docId'] as String? ?? '',
      holidays: (json['holidays'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, (e as num).toDouble()),
          ) ??
          const {},
      isApproval: json['isApproval'] as bool? ?? false,
      absentOrLeft: (json['absentOrLeft'] as num?)?.toDouble() ?? 0,
      hasSubstituteHoliday: json['hasSubstituteHoliday'] as bool? ?? false,
      projects: (json['projects'] as List<dynamic>?)
              ?.map((e) => ProjectReports.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      date: TimestampConverter.fromJsonNullable(json['date'] as Timestamp?),
      createdAt:
          TimestampConverter.fromJsonNullable(json['createdAt'] as Timestamp?),
      updatedAt:
          TimestampConverter.fromJsonNullable(json['updatedAt'] as Timestamp?),
    );

Map<String, dynamic> _$$ReportsImplToJson(_$ReportsImpl instance) =>
    <String, dynamic>{
      'docId': instance.docId,
      'holidays': instance.holidays,
      'isApproval': instance.isApproval,
      'absentOrLeft': instance.absentOrLeft,
      'hasSubstituteHoliday': instance.hasSubstituteHoliday,
      'projects': instance.projects,
      'date': instance.date?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
