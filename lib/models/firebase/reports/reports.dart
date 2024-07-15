// ignore: unused_import, unnecessary_import
import 'package:diary_report_sample/models/firebase/monthly_reports/project_reports/project_reports.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary_report_sample/converter/timestamp_converter.dart';

part 'reports.freezed.dart';
part 'reports.g.dart';

@freezed
class Reports with _$Reports {
  const factory Reports({
    @Default('') String docId,
    @Default({}) Map<String, double> holidays,
    @Default(false) bool isApproval,
    @Default(0) double absentOrLeft,
    @Default(false) bool hasSubstituteHoliday,
    @Default([]) List<ProjectReports> projects,
    @JsonKey(name: 'date', fromJson: TimestampConverter.fromJsonNullable)
    DateTime? date,
    @JsonKey(name: 'createdAt', fromJson: TimestampConverter.fromJsonNullable)
    DateTime? createdAt,
    @JsonKey(name: 'updatedAt', fromJson: TimestampConverter.fromJsonNullable)
    DateTime? updatedAt,
  }) = _Reports;

  factory Reports.fromJson(Map<String, dynamic> json) =>
      _$ReportsFromJson(json);

  factory Reports.fromFirestore(Map<String, dynamic> data, String id) =>
      Reports.fromJson(data).copyWith(docId: id);
}
