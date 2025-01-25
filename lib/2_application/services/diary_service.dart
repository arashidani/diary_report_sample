// // lib/application/services/diary_service.dart
// import 'package:diary_report_sample/1_domain/repositories/diary_repository.dart';
// import 'package:flutter/foundation.dart';
// import '../../domain/entities/diary.dart';
// import '../../domain/repositories/diary_repository.dart';
//
// class DiaryService {
//   final DiaryRepository diaryRepository;
//
//   DiaryService({@required required this.diaryRepository});
//
//   /// 日報の新規作成
//   Future<void> createDiary(Diary diary) async {
//     // 日付チェック: 未来の日付は作成できない
//     if (diary.date.isAfter(DateTime.now())) {
//       throw Exception("未来の日付の日報は作成できません");
//     }
//     // ※ 他のドメインルール（勤務時間の合計チェックなど）もここで実装可能
//
//     await diaryRepository.createDiary(diary);
//   }
//
//   /// 日報の更新
//   Future<void> updateDiary(Diary diary) async {
//     // 承認済みの日報は更新不可
//     if (diary.approved) {
//       throw Exception("承認済みの日報は更新できません");
//     }
//     await diaryRepository.updateDiary(diary);
//   }
//
//   /// 日報の削除（管理者専用）
//   Future<void> deleteDiary(String diaryId) async {
//     await diaryRepository.deleteDiary(diaryId);
//   }
//
//   /// 単一日報取得（ストリームとしても必要なら別途用意）
//   Future<Diary?> getDiary(String diaryId) async {
//     return await diaryRepository.getDiary(diaryId);
//   }
//
//   /// 指定ユーザーの日付レンジ内の日報一覧を取得
//   Future<List<Diary>> getDiariesByUserAndDateRange({
//     required String userId,
//     required DateTime start,
//     required DateTime end,
//   }) async {
//     return await diaryRepository.getDiariesByUserAndDateRange(
//         userId: userId, start: start, end: end);
//   }
// }
