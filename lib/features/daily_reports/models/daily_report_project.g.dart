// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_report_project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DailyReportProject _$DailyReportProjectFromJson(Map<String, dynamic> json) =>
    _DailyReportProject(
      business: (json['business'] as num?)?.toDouble() ?? 0.0,
      late: (json['late'] as num?)?.toDouble() ?? 0.0,
      over: (json['over'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$DailyReportProjectToJson(_DailyReportProject instance) =>
    <String, dynamic>{
      'business': instance.business,
      'late': instance.late,
      'over': instance.over,
    };
