// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies/data/models/user/user_model.dart';
import 'package:movies/domain/blocs/profile/profile_bloc.dart';
import 'package:movies/domain/repositories/auth_repository/auth_impl.dart';
import 'package:movies/domain/repositories/user_repository/user_impl.dart';
import 'package:movies/domain/utils/hooks/use_navigation.dart';

@singleton
class MainController {
  final AuthInterfaceImpl _authImpl;
  final UserInterfaceImpl _userImpl;

  MainController(this._authImpl, this._userImpl);

  void validateSession(BuildContext context) async {
    final User? currentUser = _authImpl.getCurrentUser();

    if (currentUser != null) {
      final DocumentSnapshot<UserModel>? docUser =
          await _userImpl.getUser(currentUser.uid);

      if (docUser != null && docUser.exists) {
        final UserModel user =
            docUser.data()!.copyWith(reference: docUser.reference);
        ProfileActions.setUser(context: context, user: user);
        return;
      }
      useNavigateReplacePage(context: context, route: "/login");
    } else {
      useNavigateReplacePage(context: context, route: "/login");
    }
  }
}
