// ignore: unused_import, unnecessary_import
import 'package:diary_report_sample/models/firebase/monthly_reports/project_reports/project_reports.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary_report_sample/converter/timestamp_converter.dart';

part 'monthly_reports.freezed.dart';
part 'monthly_reports.g.dart';

@freezed
class MonthlyReports with _$MonthlyReports {
  const factory MonthlyReports({
    @Default('') String docId,
    @Default([]) List<ProjectReports> projects,
    @Default(0) int sectionId,
    @Default(0) double totalBusiness,
    @Default(0) double totalOver,
    @Default(0) double totalLate,
    @JsonKey(name: 'initialDate', fromJson: TimestampConverter.fromJsonNullable)
    DateTime? initialDate,
    @JsonKey(name: 'createdAt', fromJson: TimestampConverter.fromJsonNullable)
    DateTime? createdAt,
    @JsonKey(name: 'updatedAt', fromJson: TimestampConverter.fromJsonNullable)
    DateTime? updatedAt,
  }) = _MonthlyReports;

  factory MonthlyReports.fromJson(Map<String, dynamic> json) =>
      _$MonthlyReportsFromJson(json);

  factory MonthlyReports.fromFirestore(Map<String, dynamic> data, String id) =>
      MonthlyReports.fromJson(data).copyWith(docId: id);
}
