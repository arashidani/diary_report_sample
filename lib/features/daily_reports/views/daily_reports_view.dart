import 'package:diary_report_sample/features/daily_reports/models/user_project.dart';
import 'package:diary_report_sample/features/daily_reports/viewmodels/reports_providers.dart';
import 'package:diary_report_sample/features/daily_reports/views/components/year_month_picker.dart';
import 'package:diary_report_sample/utils/datetime_ex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DailyReportsView extends ConsumerWidget {
  const DailyReportsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMonth = ref.watch(selectedMonthProvider);
    final reportsAsync = ref.watch(reportsStreamProvider(selectedMonth));

    final reportsState = ref.watch(reportsNotifierProvider);
    print(reportsState);
    final reportsNotifier = ref.read(reportsNotifierProvider.notifier);

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
                return Column(children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 12.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border(
                        bottom: BorderSide(color: Colors.grey[300]!),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 100,
                            child: Text('日付',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        Expanded(
                            flex: 2,
                            child: Text('出勤',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        Expanded(
                            flex: 2,
                            child: Text('残業',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        Expanded(
                            flex: 2,
                            child: Text('深夜',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        Expanded(
                            flex: 2,
                            child: Text('合計',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        SizedBox(
                            width: 60,
                            child: Center(
                                child: Text('承認',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold)))),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: reports.length,
                      itemBuilder: (context, index) {
                        final report = reports[index];
                        double sum = 0.0;
                        double totalBusiness = 0.0;
                        double totalOver = 0.0;
                        double totalLate = 0.0;

                        for (final project
                            in report.dailyReportProjects.values) {
                          totalBusiness += project.business;
                          totalOver += project.over;
                          totalLate += project.late;
                          sum += project.business + project.over + project.late;
                        }

                        return Dismissible(
                          key: Key(report.docId), // 一意のキーが必要
                          direction: DismissDirection.endToStart,
                          background: Container(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            color: Colors.red,
                            child:
                                const Icon(Icons.delete, color: Colors.white),
                          ),
                          confirmDismiss: (direction) async {
                            return await showDialog<bool>(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: const Text('確認'),
                                content: const Text('この日報を本当に削除しますか？'),
                                actions: [
                                  TextButton(
                                      onPressed: () =>
                                          Navigator.of(ctx).pop(false),
                                      child: const Text('キャンセル')),
                                  TextButton(
                                      onPressed: () =>
                                          Navigator.of(ctx).pop(true),
                                      child: const Text('削除')),
                                ],
                              ),
                            );
                          },
                          onDismissed: (_) {
                            // TODO: 日報削除処理
                            final removedReport = reports[index];
                            reports.removeAt(index);
                            // データベースから削除
                            reportsNotifier
                                .createDailyReport(UserProject(docId: "aaa"));
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('日報を削除しました')),
                            );
                          },

                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16.0),
                            child: Row(
                              children: [
                                SizedBox(
                                    width: 100,
                                    child: Text(
                                        report.date!.toJapaneseDateFormat())),
                                Expanded(
                                    flex: 2,
                                    child: Text(totalBusiness.toString())),
                                Expanded(
                                    flex: 2, child: Text(totalOver.toString())),
                                Expanded(
                                    flex: 2, child: Text(totalLate.toString())),
                                Expanded(flex: 2, child: Text(sum.toString())),
                                SizedBox(
                                  width: 60,
                                  child: Center(
                                      child: ApprovalStatusWidget(
                                          isApproved: report.isApproval)),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ]);
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

class ApprovalStatusWidget extends StatelessWidget {
  final bool? isApproved;

  const ApprovalStatusWidget({
    Key? key,
    required this.isApproved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isApproved == null) {
      // 未処理
      return const SizedBox(); // 空のウィジェット
    } else if (isApproved!) {
      // 承認
      return const Icon(Icons.check_circle, color: Colors.green);
    } else {
      // 否認
      return const Icon(Icons.cancel, color: Colors.red);
    }
  }
}
