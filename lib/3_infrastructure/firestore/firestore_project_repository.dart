// // lib/infrastructure/firestore/firestore_project_repository.dart
// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../../domain/entities/project.dart';
// import '../../domain/repositories/project_repository.dart';
// import 'firestore_service.dart';
//
// class FirestoreProjectRepository implements ProjectRepository {
//   final FirestoreService _firestoreService;
//
//   FirestoreProjectRepository({FirestoreService? firestoreService})
//       : _firestoreService = firestoreService ?? FirestoreService();
//
//   @override
//   Future<Project?> getProject(String projectId) async {
//     final docPath = 'projects/$projectId';
//     final docSnapshot = await FirebaseFirestore.instance.doc(docPath).get();
//     if (!docSnapshot.exists) return null;
//     final data = docSnapshot.data() as Map<String, dynamic>;
//     final project = Project.fromJson({...data, 'projectId': projectId});
//     return project;
//   }
//
//   @override
//   Future<List<Project>> getProjectsByUser(String userId) async {
//     final query = FirebaseFirestore.instance
//         .collection('projects')
//         .where('assignedUsers', arrayContains: userId);
//     final snapshot = await query.get();
//     return snapshot.docs.map((doc) {
//       final data = doc.data();
//       return Project.fromJson({...data, 'projectId': doc.id});
//     }).toList();
//   }
//
//   @override
//   Future<void> createProject(Project project) async {
//     final docPath = 'projects/${project.projectId}';
//     await _firestoreService.create(
//       path: docPath,
//       data: project.toJson(),
//     );
//   }
//
//   @override
//   Future<void> updateProject(Project project) async {
//     final docPath = 'projects/${project.projectId}';
//     await _firestoreService.update(
//       path: docPath,
//       data: project.toJson(),
//     );
//   }
//
//   @override
//   Future<void> deleteProject(String projectId) async {
//     final docPath = 'projects/$projectId';
//     await _firestoreService.delete(path: docPath);
//   }
// }
