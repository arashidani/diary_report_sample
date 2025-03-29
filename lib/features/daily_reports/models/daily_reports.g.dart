// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_reports.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DailyReports _$DailyReportsFromJson(Map<String, dynamic> json) =>
    _DailyReports(
      docId: json['docId'] as String? ?? '',
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      isApproval: json['isApproval'] as bool? ?? null,
      hasSubstituteHoliday: json['hasSubstituteHoliday'] as bool? ?? false,
      absentOrLeft: (json['absentOrLeft'] as num?)?.toDouble() ?? 0.0,
      holidays: (json['holidays'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, (e as num).toDouble()),
          ) ??
          const {},
      createdAt: const TimeStampConverter().fromJson(json['createdAt']),
      updatedAt: const TimeStampConverter().fromJson(json['updatedAt']),
    );

Map<String, dynamic> _$DailyReportsToJson(_DailyReports instance) =>
    <String, dynamic>{
      'docId': instance.docId,
      'date': instance.date?.toIso8601String(),
      'isApproval': instance.isApproval,
      'hasSubstituteHoliday': instance.hasSubstituteHoliday,
      'absentOrLeft': instance.absentOrLeft,
      'holidays': instance.holidays,
      'createdAt': const TimeStampConverter().toJson(instance.createdAt),
      'updatedAt': const TimeStampConverter().toJson(instance.updatedAt),
    };
