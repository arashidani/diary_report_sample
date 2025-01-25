// lib/infrastructure/firestore/firestore_user_repository.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary_report_sample/1_domain/models/firebase/users/users.dart';
import 'package:diary_report_sample/1_domain/repositories/user_repository.dart';
import 'package:diary_report_sample/3_infrastructure/services/firestore_service.dart';

class FirestoreUserRepository implements UserRepository {
  final FirestoreService _firestoreService;

  FirestoreUserRepository({FirestoreService? firestoreService})
      : _firestoreService = firestoreService ?? FirestoreService();

  @override
  Future<Users?> getUser(String userId) async {
    final docPath = 'users/$userId';
    final docSnapshot = await FirebaseFirestore.instance.doc(docPath).get();
    if (!docSnapshot.exists) return null;
    final data = docSnapshot.data() as Map<String, dynamic>;
    final user = Users.fromJson({...data, 'userId': userId});
    return user;
  }

  @override
  Future<void> createUser(Users user) async {
    final docPath = 'users/${user.docId}';
    print("createUser");
    await _firestoreService.create(
      path: docPath,
      data: user.toJson(),
    );
  }

  @override
  Future<void> updateUser(Users user) async {
    try {
      print("updateUser");
      final docPath = 'users/${user.docId}';
      await _firestoreService.update(
        path: docPath,
        data: user.toJson(),
      );
    } catch (e, st) {
      print(e.toString());
      print(st.toString());
    }
  }

  @override
  Future<void> deleteUser(String userId) async {
    final docPath = 'users/$userId';
    await _firestoreService.delete(path: docPath);
  }

  @override
  Future<Users?> getUserByEmail(String email) async {
    final query = FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email);
    final snapshot = await query.get();
    if (snapshot.docs.isEmpty) return null;
    final doc = snapshot.docs.first;
    return Users.fromJson({...doc.data(), 'userId': doc.id});
  }

  @override
  Future<void> createUserProfile({
    required String userId,
    required String email,
    required String firstName,
    required String lastName,
  }) async {
    final docPath = 'users/$userId';
    final newUser =
        Users(firstName: firstName, lastName: lastName, email: email);

    await _firestoreService.create(
      path: docPath,
      data: newUser.toJson(),
    );
  }
}
