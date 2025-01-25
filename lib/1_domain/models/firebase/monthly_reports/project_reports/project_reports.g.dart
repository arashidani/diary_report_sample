// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_reports.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectReportsImpl _$$ProjectReportsImplFromJson(Map<String, dynamic> json) =>
    _$ProjectReportsImpl(
      projectId: json['projectId'] as String? ?? '',
      business: (json['business'] as num?)?.toDouble() ?? 0.0,
      late: (json['late'] as num?)?.toDouble() ?? 0.0,
      over: (json['over'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$ProjectReportsImplToJson(
        _$ProjectReportsImpl instance) =>
    <String, dynamic>{
      'projectId': instance.projectId,
      'business': instance.business,
      'late': instance.late,
      'over': instance.over,
    };
