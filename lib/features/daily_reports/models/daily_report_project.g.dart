// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_report_project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DailyReportProject _$DailyReportProjectFromJson(Map<String, dynamic> json) =>
    _DailyReportProject(
      docId: json['docId'] as String? ?? '',
      business: (json['business'] as num?)?.toDouble() ?? 0.0,
      late: (json['late'] as num?)?.toDouble() ?? 0.0,
      over: (json['over'] as num?)?.toDouble() ?? 0.0,
      createdAt: const TimeStampConverter().fromJson(json['createdAt']),
      updatedAt: const TimeStampConverter().fromJson(json['updatedAt']),
    );

Map<String, dynamic> _$DailyReportProjectToJson(_DailyReportProject instance) =>
    <String, dynamic>{
      'docId': instance.docId,
      'business': instance.business,
      'late': instance.late,
      'over': instance.over,
      'createdAt': const TimeStampConverter().toJson(instance.createdAt),
      'updatedAt': const TimeStampConverter().toJson(instance.updatedAt),
    };
