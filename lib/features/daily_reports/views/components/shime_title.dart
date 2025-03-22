import 'package:diary_report_sample/features/daily_reports/viewmodels/reports_providers.dart';
import 'package:diary_report_sample/utils/japanese_era.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../components/japanese_month_picker.dart';

class ShimeTitleButton extends ConsumerWidget {
  const ShimeTitleButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(selectedMonthProvider);

    return TextButton(
      onPressed: () => showJapaneseMonthPicker(context, ref),
      child: Text(
        getShimeTitle(selected),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
