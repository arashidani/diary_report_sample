// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Users _$UsersFromJson(Map<String, dynamic> json) => _Users(
      docId: json['docId'] as String? ?? '',
      email: json['email'] as String? ?? '',
      employeeId: json['employeeId'] as String? ?? '',
      firstName: json['firstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      fullName: json['fullName'] as String? ?? '',
      divId: json['divId'] as String? ?? '',
      role: json['role'] as String? ?? '',
      createdAt: const TimeStampConverter().fromJson(json['createdAt']),
      updatedAt: const TimeStampConverter().fromJson(json['updatedAt']),
    );

Map<String, dynamic> _$UsersToJson(_Users instance) => <String, dynamic>{
      'docId': instance.docId,
      'email': instance.email,
      'employeeId': instance.employeeId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'fullName': instance.fullName,
      'divId': instance.divId,
      'role': instance.role,
      'createdAt': const TimeStampConverter().toJson(instance.createdAt),
      'updatedAt': const TimeStampConverter().toJson(instance.updatedAt),
    };
