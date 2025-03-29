import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_client/firestore_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_reports.freezed.dart';
part 'daily_reports.g.dart';

@freezed
abstract class DailyReports with _$DailyReports {
  const factory DailyReports({
    @Default('') String docId,
    @Default(null) DateTime? date,
    @Default(null) bool? isApproval,
    @Default(false) bool? hasSubstituteHoliday,
    @Default(0.0) double absentOrLeft,
    @Default({}) Map<String, double> holidays,
    @TimeStampConverter() DateTime? createdAt,
    @TimeStampConverter() DateTime? updatedAt,
  }) = _DailyReports;

  factory DailyReports.fromJson(Map<String, dynamic> json) =>
      _$DailyReportsFromJson(json);

  factory DailyReports.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return DailyReports.fromJson({...data, 'docId': doc.id});
  }
}
