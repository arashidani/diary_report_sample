import 'package:diary_report_sample/features/daily_reports/viewmodels/reports_providers.dart';
import 'package:diary_report_sample/utils/japanese_era.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void showJapaneseMonthPicker(BuildContext context, WidgetRef ref) {
  final now = DateTime.now();
  final selected = ref.read(selectedMonthProvider);
  final minYear = now.year - 3;
  final maxYear = now.year + 1;

  FixedExtentScrollController yearController =
      FixedExtentScrollController(initialItem: maxYear - selected.year);
  FixedExtentScrollController monthController =
      FixedExtentScrollController(initialItem: selected.month - 1);

  int selectedYear = selected.year;
  int selectedMonth = selected.month;

  showCupertinoModalPopup(
    context: context,
    builder: (_) => Container(
      height: 300,
      color: CupertinoColors.systemBackground.resolveFrom(context),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: CupertinoButton(
              child: const Text('決定'),
              onPressed: () {
                ref.read(selectedMonthProvider.notifier).state =
                    DateTime(selectedYear, selectedMonth, 21);
                Navigator.pop(context);
              },
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CupertinoPicker(
                    scrollController: yearController,
                    itemExtent: 32,
                    onSelectedItemChanged: (index) {
                      selectedYear = maxYear - index;
                    },
                    children: List.generate(
                      maxYear - minYear + 1,
                      (index) {
                        final y = maxYear - index;
                        return Center(child: Text(toJapaneseEra(DateTime(y))));
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: CupertinoPicker(
                    scrollController: monthController,
                    itemExtent: 32,
                    onSelectedItemChanged: (index) {
                      selectedMonth = index + 1;
                    },
                    children: List.generate(
                      12,
                      (index) => Center(child: Text('${index + 1}月')),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
