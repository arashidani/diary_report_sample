import 'package:diary_report_sample/features/daily_reports/viewmodels/reports_providers.dart';
import 'package:diary_report_sample/features/daily_reports/views/components/year_month_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.calendar_today,
                            size: 64, color: Colors.grey),
                        SizedBox(height: 16),
                        Text(
                          'この期間の日報はありません',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: reports.length,
                  itemBuilder: (context, index) {
                    final report = reports[index];
                    return GestureDetector(
                      onTap: () => {},
                      child: Container(),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(
                child: Text('エラーが発生しました: $error'),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: ElevatedButton.icon(
        icon: const Icon(Icons.edit),
        label: const Text('追加'),
        onPressed: () => {},
      ),
    );
  }
}
