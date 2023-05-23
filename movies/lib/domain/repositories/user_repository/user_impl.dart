import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:injectable/injectable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies/data/models/user/user_model.dart';
import 'package:movies/domain/repositories/user_repository/user_interface.dart';

@injectable
class UserInterfaceImpl implements UserInterface {
  final Logger _logger;
  final FirebaseFirestore _firestore;

  final _keyCollectionUsers = "users";

  UserInterfaceImpl(this._firestore, this._logger);

  @override
  Future<DocumentSnapshot<UserModel>?> getUser(String id) async {
    try {
      return _firestore
          .collection(_keyCollectionUsers)
          .doc(id)
          .withConverter<UserModel>(
              fromFirestore: (snapshot, _) =>
                  UserModel.fromJson(snapshot.data()!).copyWith(
                    reference: snapshot.reference,
                  ),
              toFirestore: (user, _) => user.toJson())
          .get();
    } on FirebaseAuthException catch (e) {
      _logger.e(e.message);
      return null;
    }
  }

  @override
  Stream<DocumentSnapshot<UserModel>>? getUserSnapshot(String id) {
    try {
      return _firestore
          .collection(_keyCollectionUsers)
          .doc(id)
          .withConverter<UserModel>(
            fromFirestore: (snapshot, _) =>
                UserModel.fromJson(snapshot.data()!),
            toFirestore: (user, _) => user.toJson(),
          )
          .snapshots();
    } on FirebaseAuthException catch (e) {
      _logger.e(e.message);
      return null;
    }
  }

  @override
  Future<Stream<DocumentSnapshot<UserModel>>?> getUserStream(String id) async {
    try {
      return _firestore
          .collection(_keyCollectionUsers)
          .doc(id)
          .withConverter<UserModel>(
            fromFirestore: (snapshot, _) =>
                UserModel.fromJson(snapshot.data()!),
            toFirestore: (user, _) => user.toJson(),
          )
          .snapshots();
    } on FirebaseAuthException catch (e) {
      _logger.e(e.message);
      return null;
    }
  }

  @override
  Future<QuerySnapshot?> findFcmToken(String token) async {
    try {
      return _firestore
          .collection(_keyCollectionUsers)
          .where("fcmToken", isEqualTo: token)
          .get();
    } on FirebaseAuthException catch (e) {
      _logger.e(e.message);
      return null;
    }
  }

  @override
  Future<bool> updateUser(String id, Map<String, dynamic> data) async {
    try {
      await _firestore.collection(_keyCollectionUsers).doc(id).update(data);
      return true;
    } on FirebaseAuthException catch (e) {
      _logger.e(e.message);
      return false;
    }
  }

  @override
  Future<bool>? createUser(String id, Map<String, dynamic> data) async {
    try {
      await _firestore.collection(_keyCollectionUsers).doc(id).set(data);
      return true;
    } on FirebaseAuthException catch (e) {
      _logger.e(e.message);
      return false;
    }
  }
}
