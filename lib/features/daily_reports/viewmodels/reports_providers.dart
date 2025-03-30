import 'package:diary_report_sample/constants/database_constants.dart';
import 'package:diary_report_sample/features/daily_reports/models/daily_reports.dart';
import 'package:diary_report_sample/features/daily_reports/viewmodels/reports_notifier.dart';
import 'package:diary_report_sample/providers/auth_state_provider.dart';
import 'package:diary_report_sample/providers/firestore_client_provider.dart';
import 'package:firestore_client/firestore_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 選択中の月を管理するProvider
final selectedMonthProvider = StateProvider<DateTime>((ref) {
  // 締め日（21日）基準で、現在の月を初期値とする
  final now = DateTime.now();
  final day = now.day;

  // 21日より前なら前月、21日以降なら当月
  if (day < 21) {
    return DateTime(now.year, now.month - 1, 21);
  } else {
    return DateTime(now.year, now.month, 21);
  }
});

/// 日報データを取得するProvider
final reportsStreamProvider = StreamProvider.autoDispose
    .family<List<DailyReports>, DateTime>((ref, baseDate) {
  // ユーザーID取得
  final userAsync = ref.watch(authStateProvider);
  final uid = userAsync.value?.uid;

  // ユーザーIDがない場合は空のリストを返す
  if (uid == null) {
    return Stream.value([]);
  }

  // Firestoreクライアント
  final firestoreClient = ref.watch(firestoreClientProvider);

  // 選択された月の日報期間（21日〜翌月20日）
  final startDate = DateTime(baseDate.year, baseDate.month, 21);
  final endDate = DateTime(baseDate.year, baseDate.month + 1, 21);

  // 日報一覧を取得
  return firestoreClient.watchQuery<DailyReports>(
    collectionPath:
        '${DatabaseConstants.USERS}/$uid/${DatabaseConstants.DAILY_REPORTS}',
    conditions: [
      QueryCondition('date', isGreaterThanOrEqualTo: startDate),
      QueryCondition('date', isLessThan: endDate),
    ],
    orderBy: ['date'],
    fromJson: (json) => DailyReports.fromJson(json),
  );
});

final reportsNotifierProvider =
    AsyncNotifierProvider<ReportsNotifier, void>(ReportsNotifier.new);
