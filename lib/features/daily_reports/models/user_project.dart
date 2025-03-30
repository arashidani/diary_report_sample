import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_client/firestore_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_project.freezed.dart';
part 'user_project.g.dart';

@freezed
abstract class UserProject with _$UserProject {
  const factory UserProject({
    @Default('') String docId,
    @TimeStampConverter() DateTime? addedAt,
  }) = _UserProject;

  factory UserProject.fromJson(Map<String, dynamic> json) =>
      _$UserProjectFromJson(json);

  factory UserProject.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return UserProject.fromJson({...data, 'docId': doc.id});
  }
}
