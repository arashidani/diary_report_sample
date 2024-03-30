const List<String> japaneseDays = ['月', '火', '水', '木', '金', '土', '日'];

String getJapaneseDay(int weekday) {
  return japaneseDays[weekday - 1];
}
