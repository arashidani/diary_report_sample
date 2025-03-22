import 'package:firestore_client/firestore_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'users.freezed.dart';
part 'users.g.dart';

@freezed
abstract class Users with _$Users {
  const factory Users({
    @Default('') String docId,
    @Default('') String email,
    @Default('') String employeeId,
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String fullName,
    @Default('') String divId,
    @Default('') String role,
    @TimeStampConverter() DateTime? createdAt,
    @TimeStampConverter() DateTime? updatedAt,
  }) = _Users;

  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);

  factory Users.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return Users.fromJson({...data, 'docId': doc.id});
  }
}
