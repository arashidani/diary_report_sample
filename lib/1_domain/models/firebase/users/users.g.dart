// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UsersImpl _$$UsersImplFromJson(Map<String, dynamic> json) => _$UsersImpl(
      docId: json['docId'] as String? ?? '',
      firstName: json['firstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      name: json['name'] as String? ?? '',
      employeeNo: json['employeeNo'] as String? ?? '',
      email: json['email'] as String? ?? '',
      role: json['role'] as String? ?? '',
      divId: json['divId'] as String? ?? '',
      projects: (json['projects'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      createdAt:
          TimestampConverter.fromJsonNullable(json['createdAt'] as Timestamp?),
      updatedAt:
          TimestampConverter.fromJsonNullable(json['updatedAt'] as Timestamp?),
    );

Map<String, dynamic> _$$UsersImplToJson(_$UsersImpl instance) =>
    <String, dynamic>{
      'docId': instance.docId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'name': instance.name,
      'employeeNo': instance.employeeNo,
      'email': instance.email,
      'role': instance.role,
      'divId': instance.divId,
      'projects': instance.projects,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
