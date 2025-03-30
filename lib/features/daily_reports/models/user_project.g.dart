// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserProject _$UserProjectFromJson(Map<String, dynamic> json) => _UserProject(
      docId: json['docId'] as String? ?? '',
      addedAt: const TimeStampConverter().fromJson(json['addedAt']),
    );

Map<String, dynamic> _$UserProjectToJson(_UserProject instance) =>
    <String, dynamic>{
      'docId': instance.docId,
      'addedAt': const TimeStampConverter().toJson(instance.addedAt),
    };
