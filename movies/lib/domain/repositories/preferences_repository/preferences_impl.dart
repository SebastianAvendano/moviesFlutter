import 'package:logger/logger.dart';
import 'package:injectable/injectable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies/domain/repositories/preferences_repository/preferences_interface.dart';

@injectable
class PreferencesImpl implements PreferencesInterface {
  final Logger _logger;
  final FirebaseFirestore _firestore;

  final _keyCollection = "movies";

  PreferencesImpl(this._firestore, this._logger);

  @override
  Future<bool> setFavorite(Map<String, dynamic> movie, int id) async {
    try {
      await _firestore.collection(_keyCollection).doc(id.toString()).set(movie);
      return true;
    } on FirebaseException catch (e) {
      _logger.e(e.message);
      return false;
    }
  }

  @override
  Future<bool> removeFavorite(int id) async {
    try {
      await _firestore.collection(_keyCollection).doc(id.toString()).delete();
      return true;
    } on FirebaseException catch (e) {
      _logger.e(e.message);
      return false;
    }
  }

  @override
  Stream<QuerySnapshot<Object?>>? getFavorites(
      DocumentReference<Object?> user) {
    try {
      return _firestore
          .collection(_keyCollection)
          .where("user", isEqualTo: user)
          .snapshots();
    } on FirebaseException catch (e) {
      _logger.e(e.message);
      return null;
    }
  }
}
