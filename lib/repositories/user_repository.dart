import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import '../models/firebase/users/users.dart';

class UserRepository {
  final FirebaseFirestore _firestore;

  UserRepository() : _firestore = FirebaseFirestore.instance;

  Stream<Users?> getUser(String uid) {
    return _firestore.collection("users").doc(uid).snapshots().map((doc) {
      return doc.exists ? Users.fromJson(doc.data()!) : null;
    });
  }
}
