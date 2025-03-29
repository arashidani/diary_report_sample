import 'package:diary_report_sample/constants/database_constants.dart';
import 'package:diary_report_sample/features/daily_reports/models/daily_reports.dart';
import 'package:diary_report_sample/providers/firestore_client_provider.dart';
import 'package:firestore_client/firestore_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final selectedMonthProvider = StateProvider<DateTime>((ref) {
  final now = DateTime.now();
  return DateTime(now.year, now.month, 21);
});

final reportsStreamProvider =
    StreamProvider.autoDispose.family((ref, DateTime baseMonth) {
  final firestoreClient = ref.watch(firestoreClientProvider);

  final start = DateTime(baseMonth.year, baseMonth.month, 21);
  final end = DateTime(baseMonth.year, baseMonth.month + 1, 21);
  // return firestoreClient.watchInSubCollection<DailyReports>(
  //   parentCollectionPath: DatabaseConstants.USERS,
  //   parentDocId: '3hq19jY7PKTXmlY4oAcCaraIYSi1',
  //   subCollectionName: DatabaseConstants.DAILY_REPORTS,
  //   fromJson: DailyReports.fromJson,
  // );
  final reportsStream = firestoreClient.watchQuery<DailyReports>(
    collectionPath: 'users/3hq19jY7PKTXmlY4oAcCaraIYSi1/dailyReports',
    conditions: [
      QueryCondition('date', isGreaterThanOrEqualTo: start),
      QueryCondition('date', isLessThan: end),
    ],
    orderBy: ['date'],
    fromJson: (json) => DailyReports.fromJson(json),
  );

  return reportsStream;
});
