// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/domain/repositories/preferences_repository/preferences_impl.dart';

@singleton
class FavoriteController {
  final PreferencesImpl _preferencesImpl;

  FavoriteController(this._preferencesImpl);

  Stream<QuerySnapshot>? getMovies(DocumentReference user) =>
      _preferencesImpl.getFavorites(user);

  Stream<QuerySnapshot>? getListAmenities(DocumentReference user) =>
      _preferencesImpl.getFavorites(user);
}
