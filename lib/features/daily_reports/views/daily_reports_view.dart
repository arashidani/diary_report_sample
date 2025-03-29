import 'package:diary_report_sample/features/daily_reports/models/daily_reports.dart';
import 'package:diary_report_sample/features/daily_reports/viewmodels/reports_providers.dart';
import 'package:diary_report_sample/features/daily_reports/views/components/monthly_summary.dart';
import 'package:diary_report_sample/features/daily_reports/views/components/report_list_tile.dart';
import 'package:diary_report_sample/features/daily_reports/views/components/year_month_picker.dart';
import 'package:diary_report_sample/utils/japanese_era.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'components/holidary_pie_chart.dart';
import 'components/report_edit_sheet.dart';

class DailyReportsView extends ConsumerWidget {
  const DailyReportsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMonth = ref.watch(selectedMonthProvider);
    final reportsAsync = ref.watch(reportsStreamProvider(selectedMonth));

    return Scaffold(
      appBar: AppBar(
        title: const Text('日報一覧'),
      ),
      body: Column(
        children: [
          // 年月選択UI
          YearMonthPicker(
            selectedDate: selectedMonth,
            onChanged: (newDate) {
              ref.read(selectedMonthProvider.notifier).state = newDate;
            },
          ),

          // 日報リスト
          Expanded(
            child: reportsAsync.when(
              data: (reports) {
                if (reports.isEmpty) {
                  return const Center(
                    child: Text('この期間の日報はありません'),
                  );
                }
                // TODO: ここに日報のリストView
                return Container(child: Center(child: Text('日報リストあり')));
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(
                child: Text('エラーが発生しました: $error'),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddReportSheet(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddReportSheet(BuildContext context) {
    // microtaskでラップして実行順序の問題を解決
    Future.microtask(() {
      if (context.mounted) {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (_) => Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: const ReportsEditSheet(),
          ),
        );
      }
    });
  }
}

// 日報表示用の拡張メソッド
extension DailyReportFormatting on DailyReports {
  String get formattedDate {
    if (date == null) return '日付なし';
    return DateFormat('yyyy年MM月dd日').format(date!);
  }

  String get statusText {
    if (isApproval == true) {
      return '承認済み';
    } else if (isApproval == false) {
      return '未承認';
    } else {
      return '下書き';
    }
  }
}
