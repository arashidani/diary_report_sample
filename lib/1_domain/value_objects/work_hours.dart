import 'package:meta/meta.dart';

@immutable
class WorkHours {
  /// 通常勤務時間（0〜8時間）
  final int regularHours;

  /// 残業時間（0以上）
  final int overtimeHours;

  /// 深夜勤務時間（0以上）
  final int nightHours;

  /// 合計勤務時間：通常 + 残業 + 深夜
  int get total => regularHours + overtimeHours + nightHours;

  /// コンストラクタ（検証付き）
  ///
  /// * [regularHours] は 0〜8 の値でなければならない
  /// * 各値はマイナス不可
  /// * 合計が 24 時間以内でなければならない
  WorkHours({
    required this.regularHours,
    required this.overtimeHours,
    required this.nightHours,
  }) {
    _validate();
  }

  /// 入力値の検証
  void _validate() {
    // 各値がマイナスでないことの確認
    if (regularHours < 0 || overtimeHours < 0 || nightHours < 0) {
      throw ArgumentError('勤務時間は負の値になれません');
    }
    // 通常勤務時間は8時間以内
    if (regularHours > 8) {
      throw ArgumentError('通常勤務時間は8時間以内にしてください');
    }
    // 合計勤務時間は24時間以内
    if (total > 24) {
      throw ArgumentError('合計勤務時間は24時間以内にしてください');
    }
  }

  /// 値を変更した新しい WorkHours を生成するためのヘルパー
  WorkHours copyWith({
    int? regularHours,
    int? overtimeHours,
    int? nightHours,
  }) {
    return WorkHours(
      regularHours: regularHours ?? this.regularHours,
      overtimeHours: overtimeHours ?? this.overtimeHours,
      nightHours: nightHours ?? this.nightHours,
    );
  }

  @override
  String toString() {
    return 'WorkHours(regular: $regularHours, overtime: $overtimeHours, night: $nightHours, total: $total)';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkHours &&
          runtimeType == other.runtimeType &&
          regularHours == other.regularHours &&
          overtimeHours == other.overtimeHours &&
          nightHours == other.nightHours;

  @override
  int get hashCode =>
      regularHours.hashCode ^ overtimeHours.hashCode ^ nightHours.hashCode;
}
