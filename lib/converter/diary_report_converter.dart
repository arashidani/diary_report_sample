import 'dart:core';
import 'package:flutter/cupertino.dart';

List<DateTime> getMonthRange(int year, int month) {
  // 引数の年と月の数字を元にDateTimeオブジェクトを生成
  DateTime currentDate = DateTime(year, month, 21);

  // 期間の開始日を取得
  DateTime startDate = currentDate;

  // 1か月後の日付を計算
  currentDate = DateTime(currentDate.year, currentDate.month + 1, 20);

  // 期間の終了日を取得
  DateTime endDate = currentDate;

  // 結果をListに格納して返す
  List<DateTime> result = [];

  while (startDate.isBefore(endDate)) {
    // Listに追加
    result.add(startDate);

    // 次の日付に移動
    startDate = startDate.add(const Duration(days: 1));
  }
  debugPrint(result.toString());

  return result;
}
