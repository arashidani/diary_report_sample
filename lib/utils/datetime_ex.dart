import 'package:intl/intl.dart';

extension DateTimeEx on DateTime {
  String toJapaneseDateFormat() {
    final formatter = DateFormat('M/d', 'ja_JP');
    final dayOfWeekJapanese = ['日', '月', '火', '水', '木', '金', '土'][weekday % 7];
    return '${formatter.format(this)}($dayOfWeekJapanese)';
  }
}
