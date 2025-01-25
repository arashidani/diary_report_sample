// // lib/infrastructure/firestore/firestore_diary_repository.dart
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:diary_report_sample/1_domain/repositories/diary_repository.dart';
// import 'package:diary_report_sample/3_infrastructure/services/firestore_service.dart';
// import '../../domain/entities/diary.dart';
// import 'firestore_service.dart';
//
// class FirestoreDiaryRepository implements DiaryRepository {
//   final FirestoreService _firestoreService;
//
//   FirestoreDiaryRepository({FirestoreService? firestoreService})
//       : _firestoreService = firestoreService ?? FirestoreService();
//
//   @override
//   Future<Diary?> getDiary(String diaryId) async {
//     final docPath = 'diaries/$diaryId';
//     final docSnapshot = await FirebaseFirestore.instance.doc(docPath).get();
//     if (!docSnapshot.exists) return null;
//     final data = docSnapshot.data() as Map<String, dynamic>;
//     // Firestore から取得した JSON にドキュメントID を付与してデシリアライズ
//     final diary = Diary.fromJson({...data, 'diaryId': diaryId});
//     return diary;
//   }
//
//   @override
//   Future<List<Diary>> getDiariesByUserAndDateRange({
//     required String userId,
//     required DateTime start,
//     required DateTime end,
//   }) async {
//     final query = FirebaseFirestore.instance
//         .collection('diaries')
//         .where('userId', isEqualTo: userId)
//         .where('date', isGreaterThanOrEqualTo: Timestamp.fromDate(start))
//         .where('date', isLessThanOrEqualTo: Timestamp.fromDate(end));
//
//     final snapshot = await query.get();
//     return snapshot.docs.map((doc) {
//       final data = doc.data();
//       return Diary.fromJson({...data, 'diaryId': doc.id});
//     }).toList();
//   }
//
//   @override
//   Future<void> createDiary(Diary diary) async {
//     final docPath = 'diaries/${diary.diaryId}';
//     await _firestoreService.create(
//       path: docPath,
//       data: diary.toJson(),
//     );
//   }
//
//   @override
//   Future<void> updateDiary(Diary diary) async {
//     final docPath = 'diaries/${diary.diaryId}';
//     await _firestoreService.update(
//       path: docPath,
//       data: diary.toJson(),
//     );
//   }
//
//   @override
//   Future<void> deleteDiary(String diaryId) async {
//     final docPath = 'diaries/$diaryId';
//     await _firestoreService.delete(path: docPath);
//   }
// }
