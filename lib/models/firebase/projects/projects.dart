import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:diary_report_sample/converter/timestamp_converter.dart';

part 'projects.freezed.dart';
part 'projects.g.dart';

@freezed
class Projects with _$Projects {
  const factory Projects({
    required String id,
    required double business,
    required double over,
    required double late,
    @JsonKey(name: 'createdAt', fromJson: TimestampConverter.fromJsonNullable)
    DateTime? createdAt,
    @JsonKey(name: 'updatedAt', fromJson: TimestampConverter.fromJsonNullable)
    DateTime? updatedAt,
  }) = _Projects;

  factory Projects.fromJson(Map<String, dynamic> json) =>
      _$ProjectsFromJson(json);

  factory Projects.fromFirestore(DocumentSnapshot doc) => Projects(
        id: doc.id,
        business: (doc.data() as Map<String, dynamic>)['business'] ?? 0,
        over: (doc.data() as Map<String, dynamic>)['over'] ?? 0,
        late: (doc.data() as Map<String, dynamic>)['late'] ?? 0,
      );
}
