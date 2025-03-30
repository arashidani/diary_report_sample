// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Project _$ProjectFromJson(Map<String, dynamic> json) => _Project(
      docId: json['docId'] as String? ?? '',
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      period: (json['period'] as num?)?.toInt() ?? 0,
      taskType: json['taskType'] as String? ?? '',
      groupId: json['groupId'] as String? ?? '',
    );

Map<String, dynamic> _$ProjectToJson(_Project instance) => <String, dynamic>{
      'docId': instance.docId,
      'name': instance.name,
      'description': instance.description,
      'period': instance.period,
      'taskType': instance.taskType,
      'groupId': instance.groupId,
    };
