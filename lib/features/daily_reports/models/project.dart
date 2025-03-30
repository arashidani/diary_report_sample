// lib/features/projects/models/project.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'project.freezed.dart';
part 'project.g.dart';

@freezed
abstract class Project with _$Project {
  const factory Project({
    @Default('') String docId,
    @Default('') String name,
    @Default('') String description,
    @Default(0) int period,
    @Default('') String taskType,
    @Default('') String groupId,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);

  factory Project.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return Project.fromJson({...data, 'docId': doc.id});
  }
}
