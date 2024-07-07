// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monthly_reports.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MonthlyReportsImpl _$$MonthlyReportsImplFromJson(Map<String, dynamic> json) =>
    _$MonthlyReportsImpl(
      docId: json['docId'] as String? ?? '',
      projects: (json['projects'] as List<dynamic>?)
              ?.map((e) => ProjectReports.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      sectionId: json['sectionId'] as int? ?? 0,
      totalBusiness: (json['totalBusiness'] as num?)?.toDouble() ?? 0,
      totalOver: (json['totalOver'] as num?)?.toDouble() ?? 0,
      totalLate: (json['totalLate'] as num?)?.toDouble() ?? 0,
      initialDate: TimestampConverter.fromJsonNullable(
          json['initialDate'] as Timestamp?),
      createdAt:
          TimestampConverter.fromJsonNullable(json['createdAt'] as Timestamp?),
      updatedAt:
          TimestampConverter.fromJsonNullable(json['updatedAt'] as Timestamp?),
    );

Map<String, dynamic> _$$MonthlyReportsImplToJson(
        _$MonthlyReportsImpl instance) =>
    <String, dynamic>{
      'docId': instance.docId,
      'projects': instance.projects,
      'sectionId': instance.sectionId,
      'totalBusiness': instance.totalBusiness,
      'totalOver': instance.totalOver,
      'totalLate': instance.totalLate,
      'initialDate': instance.initialDate?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
