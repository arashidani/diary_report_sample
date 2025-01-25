// import 'package:diary_report_sample/1_domain/repositories/diary_repository.dart';
//
// class UpdateDiary {
//   final DiaryRepository diaryRepository;
//
//   UpdateDiary({required this.diaryRepository});
//
//   /// 日報更新ユースケース
//   /// [diary]：更新対象の日報エンティティ（freezed の immutability を利用）
//   /// [newProjectsData]：更新時の案件ごとの勤務時間データ（Map のリストとして想定）
//   /// [newSpecialLeaves]：更新時の休暇情報
//   Future<void> execute({
//     required Diary diary,
//     List<Map<String, dynamic>>? newProjectsData,
//     Map<String, int>? newSpecialLeaves,
//   }) async {
//     // 承認済みの日報は編集不可
//     if (diary.approved) {
//       throw Exception("承認済みの日報は編集できません");
//     }
//
//     // 更新時のデータを用いてコピー（freezedの immutability 対策）
//     Diary updatedDiary;
//
//     if (newProjectsData != null) {
//       final newProjects = newProjectsData.map((data) {
//         return DiaryProject(
//           projectId: data['projectId'],
//           regularHours: data['regularHours'] as int?,
//           overtimeHours: data['overtimeHours'] as int?,
//           nightHours: data['nightHours'] as int?,
//         );
//       }).toList();
//
//       updatedDiary = diary.copyWith(
//         projects: newProjects,
//         specialLeaves: newSpecialLeaves ?? diary.specialLeaves,
//         updatedAt: DateTime.now(),
//       );
//     } else {
//       updatedDiary = diary.copyWith(
//         specialLeaves: newSpecialLeaves ?? diary.specialLeaves,
//         updatedAt: DateTime.now(),
//       );
//     }
//
//     await diaryRepository.updateDiary(updatedDiary);
//   }
// }
