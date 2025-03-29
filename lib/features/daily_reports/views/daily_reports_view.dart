import 'package:diary_report_sample/features/daily_reports/viewmodels/reports_providers.dart';
import 'package:diary_report_sample/features/daily_reports/views/components/report_list_tile.dart';
import 'package:diary_report_sample/features/daily_reports/views/components/reports_edit_sheet.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'components/shime_title.dart';

class DailyReportsView extends ConsumerWidget {
  const DailyReportsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMonth = ref.watch(selectedMonthProvider);
    final diaryStream = ref.watch(reportsStreamProvider(selectedMonth));

    return Scaffold(
      appBar: AppBar(
        title: const Text('日報一覧'),
        actions: const [ShimeTitleButton()],
      ),
      body: SelectionArea(child: Container()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) => const Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: ReportsEditSheet(),
            ),
          );
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}
