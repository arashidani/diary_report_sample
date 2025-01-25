// ignore: unused_import, unnecessary_import
import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_reports.freezed.dart';
part 'project_reports.g.dart';

@freezed
class ProjectReports with _$ProjectReports {
  const factory ProjectReports({
    //@Default('') String docId,
    @Default('') String projectId,
    @Default(0.0) double business,
    @Default(0.0) double late,
    @Default(0.0) double over,
  }) = _ProjectReports;

  factory ProjectReports.fromJson(Map<String, dynamic> json) =>
      _$ProjectReportsFromJson(json);

  // factory ProjectReports.fromFirestore(Map<String, dynamic> data, String id) =>
  //     ProjectReports.fromJson(data).copyWith(docId: id);
}
