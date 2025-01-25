// abstract class DiaryRepository {
//   /// 指定したIDの日報を取得する
//   Future<Diary?> getDiary(String diaryId);
//
//   /// ユーザーごと、かつ指定した期間内の日報リストを取得する
//   Future<List<Diary>> getDiariesByUserAndDateRange({
//     required String userId,
//     required DateTime start,
//     required DateTime end,
//   });
//
//   /// 新規日報を作成する
//   Future<void> createDiary(Diary diary);
//
//   /// 既存日報を更新する
//   Future<void> updateDiary(Diary diary);
//
//   /// 指定したIDの日報を削除する（管理者専用操作）
//   Future<void> deleteDiary(String diaryId);
// }
