import 'package:diary_report_sample/features/daily_reports/models/daily_reports.dart';
import 'package:diary_report_sample/features/daily_reports/viewmodels/reports_providers.dart';
import 'package:diary_report_sample/features/daily_reports/views/components/calendar_picker.dart';
import 'package:diary_report_sample/utils/japanese_era.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class YearMonthPicker extends ConsumerWidget {
  final DateTime selectedDate;
  final Function(DateTime) onChanged;

  const YearMonthPicker({
    Key? key,
    required this.selectedDate,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 現在年から5年前までを選択可能に
    final currentYear = DateTime.now().year;
    final years = List.generate(5, (index) => currentYear - index);

    // 月のリスト (1-12)
    final months = List.generate(12, (index) => index + 1);

    // 日報データを取得
    final reportsAsync = ref.watch(reportsStreamProvider(selectedDate));

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            getShimeTitle(selectedDate),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 年選択
              Expanded(
                child: DropdownButtonFormField<int>(
                  decoration: const InputDecoration(
                    labelText: '年',
                    isDense: true,
                    border: OutlineInputBorder(),
                  ),
                  value: selectedDate.year,
                  items: years.map((year) {
                    final yearText = toJapaneseEra(DateTime(year, 1, 1));
                    return DropdownMenuItem(
                      value: year,
                      child: Text(yearText),
                    );
                  }).toList(),
                  onChanged: (year) {
                    if (year != null) {
                      final newDate = DateTime(
                        year,
                        selectedDate.month,
                        21, // 締め日基準
                      );
                      onChanged(newDate);
                    }
                  },
                ),
              ),
              const SizedBox(width: 16),
              // 月選択
              Expanded(
                child: DropdownButtonFormField<int>(
                  decoration: const InputDecoration(
                    labelText: '月',
                    isDense: true,
                    border: OutlineInputBorder(),
                  ),
                  value: selectedDate.month,
                  items: months.map((month) {
                    return DropdownMenuItem(
                      value: month,
                      child: Text('$month月'),
                    );
                  }).toList(),
                  onChanged: (month) {
                    if (month != null) {
                      final newDate = DateTime(
                        selectedDate.year,
                        month,
                        21, // 締め日基準
                      );
                      onChanged(newDate);
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showCalendarDialog(
      BuildContext context, WidgetRef ref, List<DailyReports> reports) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          padding: const EdgeInsets.all(16),
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${selectedDate.year}年${selectedDate.month}月',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 400,
                child: CalendarPicker(
                  selectedMonth: selectedDate,
                  reports: reports,
                  onDateSelected: (date) {
                    onChanged(date);
                    Navigator.of(context).pop();
                  },
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('閉じる'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
