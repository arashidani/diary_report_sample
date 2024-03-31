import 'package:intl/intl.dart';

String formatDateString(DateTime date) {
  final formatter = DateFormat('yyyy年M月d日');
  return formatter.format(date);
}
