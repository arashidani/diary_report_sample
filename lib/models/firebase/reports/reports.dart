import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:diary_report_sample/converter/timestamp_converter.dart';

part 'reports.freezed.dart';
part 'reports.g.dart';

@freezed
class Reports with _$Reports {
  const factory Reports({
    required String id,
    required Map<String, dynamic> holidays,
    required bool isApproval,
    required double absentOrLeft,
    required String projectId,
    @JsonKey(name: 'date', fromJson: TimestampConverter.fromJsonNullable)
    DateTime? date,
    // TODO: あとで追加する
    // bool hasSubstituteHoliday,
    @JsonKey(name: 'createdAt', fromJson: TimestampConverter.fromJsonNullable)
    DateTime? createdAt,
    @JsonKey(name: 'updatedAt', fromJson: TimestampConverter.fromJsonNullable)
    DateTime? updatedAt,
  }) = _Reports;

  factory Reports.fromJson(Map<String, dynamic> json) =>
      _$ReportsFromJson(json);

  factory Reports.fromFirestore(DocumentSnapshot doc) => Reports(
      id: doc.id,
      holidays: {},
      isApproval: false,
      absentOrLeft: 0,
      projectId: '');
}
