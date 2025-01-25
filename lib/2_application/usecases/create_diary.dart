// // lib/application/use_cases/create_diary.dart
// import 'package:meta/meta.dart';
// import '../../domain/entities/diary.dart';
// import '../../domain/entities/diary_project.dart';
// import '../../domain/repositories/diary_repository.dart';
//
// class CreateDiary {
//   final DiaryRepository diaryRepository;
//
//   CreateDiary({required this.diaryRepository});
//
//   /// 日報作成ユースケース
//   /// - [diaryId] : 日報の一意識別子
//   /// - [userId]  : 日報を作成するユーザーのID
//   /// - [date]    : 日報の日付（未来日付チェックを実施）
//   /// - [projectsData] : 案件ごとの勤務時間データの一覧（Map のリストとして想定）
//   /// - [specialLeaves]: 特別休暇等の休暇情報（例: {'有給休暇': 4}）
//   Future<void> execute({
//     required String diaryId,
//     required String userId,
//     required DateTime date,
//     required List<Map<String, dynamic>> projectsData,
//     Map<String, int>? specialLeaves,
//   }) async {
//     // 日付チェック: 未来の日報は作成不可
//     if (date.isAfter(DateTime.now())) {
//       throw Exception("未来の日付の日報は作成できません");
//     }
//
//     // 各案件データを DiaryProject に変換
//     final projects = projectsData.map((data) {
//       return DiaryProject(
//         projectId: data['projectId'],
//         regularHours: data['regularHours'] as int?,
//         overtimeHours: data['overtimeHours'] as int?,
//         nightHours: data['nightHours'] as int?,
//       );
//     }).toList();
//
//     final diary = Diary(
//       diaryId: diaryId,
//       userId: userId,
//       date: date,
//       approved: false,
//       projects: projects,
//       specialLeaves: specialLeaves,
//       createdAt: DateTime.now(),
//       updatedAt: DateTime.now(),
//     );
//
//     await diaryRepository.createDiary(diary);
//   }
// }
