import 'package:cloud_firestore/cloud_firestore.dart';

abstract class PreferencesInterface {
  Future<bool> setFavorite(Map<String, dynamic> movie, int id);
  Future<bool> removeFavorite(int id);
  Stream<QuerySnapshot<Object?>>? getFavorites(DocumentReference<Object?> user);
}
