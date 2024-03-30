import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

// Firestoreと通信をする抽象クラス
class FirestoreService {
  final _firestore = FirebaseFirestore.instance;

  // ドキュメントの追加
  Future<void> addData(String collectionName, Map<String, dynamic> data) async {
    try {
      data.addAll(<String, dynamic>{
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp()
      });
      await _firestore.collection(collectionName).add(data);
    } catch (e) {
      debugPrint("Error adding document: $e");
    }
  }

  // ドキュメントの更新
  Future<void> updateData(String collectionName, String documentId,
      Map<String, dynamic> data) async {
    try {
      data.addAll(<String, dynamic>{'updatedAt': FieldValue.serverTimestamp()});
      await _firestore.collection(collectionName).doc(documentId).update(data);
    } catch (e) {
      debugPrint("Error updating document: $e");
    }
  }

  // ドキュメントの削除
  Future<void> deleteData(String collectionName, String documentId) async {
    try {
      await _firestore.collection(collectionName).doc(documentId).delete();
    } catch (e) {
      debugPrint("Error deleting document: $e");
    }
  }

  Stream<T> documentStream<T>({
    @required required String collectionName,
    @required required T builder(Map<String, dynamic> data, String documentID),
  }) {
    final DocumentReference reference =
        FirebaseFirestore.instance.doc(collectionName);
    final Stream<DocumentSnapshot> snapshots = reference.snapshots();
    return snapshots.map((snapshot) =>
        builder(snapshot.data() as Map<String, dynamic>, snapshot.id));
  }

  Future<bool> docExist<T>({
    @required required String collectionName,
    @required required T builder(Map<String, dynamic> data, String documentID),
  }) async {
    final document = await FirebaseFirestore.instance.doc(collectionName).get();
    return document.exists;
  }
}
