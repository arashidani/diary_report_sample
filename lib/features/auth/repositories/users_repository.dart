import 'package:diary_report_sample/constants/database_constants.dart';
import 'package:diary_report_sample/features/auth/models/users.dart';
import 'package:firestore_client/firestore_client.dart';

class UsersRepository {
  final FirestoreClient _firestoreClient;

  UsersRepository(this._firestoreClient);

  Future<Users?> getUser(String userId) {
    return _firestoreClient.read(
      collectionPath: DatabaseConstants.USERS,
      docId: userId,
      fromJson: Users.fromJson,
    );
  }

  Future<void> createUser(Users user) {
    return _firestoreClient.create(
      collectionPath: DatabaseConstants.USERS,
      docId: user.docId,
      data: user,
      toJson: (user) => user.toJson(),
    );
  }

  Future<void> updateUser(Users user) {
    return _firestoreClient.update(
      collectionPath: DatabaseConstants.USERS,
      docId: user.docId,
      data: user,
      toJson: (user) => user.toJson(),
    );
  }

  Future<void> deleteUser(String userId) {
    return _firestoreClient.delete(
      collectionPath: DatabaseConstants.USERS,
      docId: userId,
    );
  }
}
