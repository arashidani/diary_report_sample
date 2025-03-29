import 'package:diary_report_sample/features/daily_reports/models/daily_reports.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarPicker extends StatefulWidget {
  final DateTime selectedMonth;
  final List<DailyReports> reports;
  final Function(DateTime) onDateSelected;

  const CalendarPicker({
    Key? key,
    required this.selectedMonth,
    required this.reports,
    required this.onDateSelected,
  }) : super(key: key);

  @override
  State<CalendarPicker> createState() => _CalendarPickerState();
}

class _CalendarPickerState extends State<CalendarPicker> {
  late PageController _pageController;
  late DateTime _currentMonth;

  @override
  void initState() {
    super.initState();
    _currentMonth =
        DateTime(widget.selectedMonth.year, widget.selectedMonth.month, 1);
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // カレンダーヘッダー
        _buildCalendarHeader(),

        // カレンダーページ
        SizedBox(
          height: 300,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              // 前後の月に移動
              setState(() {
                if (index > _pageController.page!.round()) {
                  _currentMonth = DateTime(
                    _currentMonth.year,
                    _currentMonth.month + 1,
                    1,
                  );
                } else {
                  _currentMonth = DateTime(
                    _currentMonth.year,
                    _currentMonth.month - 1,
                    1,
                  );
                }
              });
            },
            itemBuilder: (context, index) {
              // 現在のページの月
              final year = _currentMonth.year;
              final month = _currentMonth.month;

              return _buildMonthCalendar(year, month);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCalendarHeader() {
    final dateFormat = DateFormat('yyyy年MM月');

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () {
              _pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
          ),
          Text(
            dateFormat.format(_currentMonth),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: () {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMonthCalendar(int year, int month) {
    // 日本語の曜日
    const weekdays = ['月', '火', '水', '木', '金', '土', '日'];

    // 月の最初の日
    final firstDay = DateTime(year, month, 1);

    // 月の最後の日
    final lastDay = DateTime(year, month + 1, 0);

    // カレンダーの最初の日（月曜始まり）
    final firstMonday = firstDay.weekday == 1
        ? firstDay
        : firstDay.subtract(Duration(days: firstDay.weekday - 1));

    // カレンダーに表示する日数（最大42日 = 6週間）
    final daysInCalendar =
        (lastDay.difference(firstMonday).inDays + 1 + (7 - lastDay.weekday) % 7)
            .clamp(28, 42);

    // 日報があるの日付を取得
    final reportDates = widget.reports
        .where((report) => report.date != null)
        .map((report) => DateTime(
              report.date!.year,
              report.date!.month,
              report.date!.day,
            ))
        .toSet();

    return Column(
      children: [
        // 曜日ヘッダー
        Row(
          children: weekdays
              .map((day) => Expanded(
                    child: Center(
                      child: Text(
                        day,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: day == '土'
                              ? Colors.blue
                              : (day == '日' ? Colors.red : null),
                        ),
                      ),
                    ),
                  ))
              .toList(),
        ),
        const Divider(),

        // カレンダー日付グリッド
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              childAspectRatio: 1.2,
            ),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: daysInCalendar,
            itemBuilder: (context, index) {
              final date = firstMonday.add(Duration(days: index));
              final isCurrentMonth = date.month == month;
              final isToday = _isToday(date);
              final hasReport = reportDates.contains(DateTime(
                date.year,
                date.month,
                date.day,
              ));

              // 土曜日は青、日曜日は赤
              final isWeekend = date.weekday == 6 || date.weekday == 7;
              final isSelectionDate =
                  date.day == 21 && date.month == widget.selectedMonth.month;

              return GestureDetector(
                onTap: () {
                  // 選択した日付を20:00:00に設定して渡す（日付ピッカー向け）
                  final selectedDate =
                      DateTime(date.year, date.month, date.day, 20);
                  widget.onDateSelected(selectedDate);
                },
                child: Container(
                  margin: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: isSelectionDate
                        ? Theme.of(context).primaryColor.withOpacity(0.2)
                        : isToday
                            ? Colors.amber.withOpacity(0.2)
                            : null,
                    borderRadius: BorderRadius.circular(8),
                    border: isCurrentMonth
                        ? Border.all(
                            color: hasReport
                                ? Theme.of(context).primaryColor
                                : Colors.transparent,
                            width: 1,
                          )
                        : null,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${date.day}',
                        style: TextStyle(
                          color: !isCurrentMonth
                              ? Colors.grey.withOpacity(0.5)
                              : isWeekend
                                  ? date.weekday == 6
                                      ? Colors.blue
                                      : Colors.red
                                  : null,
                          fontWeight: isToday || isSelectionDate
                              ? FontWeight.bold
                              : null,
                        ),
                      ),
                      if (hasReport)
                        Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                      if (date.day == 21)
                        const Text(
                          '締日',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  bool _isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }
}
