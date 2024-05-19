// ignore: unused_import, unnecessary_import
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary_report_sample/converter/timestamp_converter.dart';

part 'users.freezed.dart';
part 'users.g.dart';

@freezed
class Users with _$Users {
  const factory Users({
    @Default('') String docId,
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String name,
    @Default('') String employeeNo,
    @Default('') String email,
    @Default('') String role,
    @Default('') String divId,
    @Default([]) List<String> projects,
    @JsonKey(name: 'createdAt', fromJson: TimestampConverter.fromJsonNullable)
    DateTime? createdAt,
    @JsonKey(name: 'updatedAt', fromJson: TimestampConverter.fromJsonNullable)
    DateTime? updatedAt,
  }) = _Users;

  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);

  factory Users.fromFirestore(Map<String, dynamic> data, String id) =>
      Users.fromJson(data).copyWith(docId: id);
}
