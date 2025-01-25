import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// ドキュメントストリームを返す（1件のドキュメントを購読）
  Stream<T> docStream<T>({
    required String path,
    required T Function(Map<String, dynamic> data, String documentId)
        fromFirestore,
  }) {
    return _firestore.doc(path).snapshots().map((doc) {
      if (doc.exists) {
        final data = doc.data() as Map<String, dynamic>;
        return fromFirestore(data, doc.id);
      } else {
        throw Exception("Document does not exist at $path");
      }
    });
  }

  /// ドキュメントの新規作成
  Future<void> create({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    await _firestore.doc(path).set(data);
  }

  /// ドキュメントの更新
  Future<void> update({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    await _firestore.doc(path).update(data);
  }

  /// ドキュメントの削除
  Future<void> delete({
    required String path,
  }) async {
    await _firestore.doc(path).delete();
  }

  /// 指定パスにドキュメントが存在するかを返す
  Future<bool> exists({
    required String path,
  }) async {
    final doc = await _firestore.doc(path).get();
    return doc.exists;
  }

  /// 指定コレクション内（またはクエリ結果）のドキュメント件数を返す
  Future<int> count({
    required String collectionPath,
    Query<Map<String, dynamic>>? query,
  }) async {
    QuerySnapshot<Map<String, dynamic>> snapshot;
    if (query != null) {
      snapshot = await query.get();
    } else {
      snapshot = await _firestore.collection(collectionPath).get();
    }
    return snapshot.size;
  }

  /// コレクションのドキュメントリストのストリームを取得する例（必要に応じて）
  Stream<List<T>> collectionStream<T>({
    required String path,
    required T Function(Map<String, dynamic> json, String documentId)
        fromFirestore,
    Query<Map<String, dynamic>>? query,
  }) {
    CollectionReference ref = _firestore.collection(path);
    final stream = (query != null ? query.snapshots() : ref.snapshots());
    return stream.map((snapshot) => snapshot.docs.map((doc) {
          return fromFirestore(doc.data() as Map<String, dynamic>, doc.id);
        }).toList());
  }
}
