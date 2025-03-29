const int kShimeDay = 20;

String toJapaneseEra(DateTime date) {
  if (date.isBefore(DateTime(1989, 1, 8))) {
    final year = date.year - 1925;
    return '昭和$year年';
  } else if (date.isBefore(DateTime(2019, 5, 1))) {
    final year = date.year - 1988;
    return '平成$year年';
  } else {
    final year = date.year - 2018;
    return '令和$year年';
  }
}

String getShimeTitle(DateTime baseMonth) {
  final start = DateTime(baseMonth.year, baseMonth.month, kShimeDay + 1);
  final end = DateTime(baseMonth.year, baseMonth.month + 1, kShimeDay);
  return '${toJapaneseEra(start)}${start.month}月（${start.month}/${start.day}〜${end.month}/${end.day}）';
}
