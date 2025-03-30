import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_client/firestore_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_report_project.freezed.dart';
part 'daily_report_project.g.dart';

@freezed
abstract class DailyReportProject with _$DailyReportProject {
  const factory DailyReportProject({
    @Default(0.0) double business,
    @Default(0.0) double late,
    @Default(0.0) double over,
  }) = _DailyReportProject;

  factory DailyReportProject.fromJson(Map<String, dynamic> json) =>
      _$DailyReportProjectFromJson(json);

  factory DailyReportProject.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return DailyReportProject.fromJson({...data, 'docId': doc.id});
  }
}
