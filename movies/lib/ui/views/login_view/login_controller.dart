// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:movies/data/models/user/user_model.dart';
import 'package:movies/domain/blocs/profile/profile_bloc.dart';
import 'package:movies/domain/repositories/auth_repository/auth_impl.dart';
import 'package:movies/domain/repositories/user_repository/user_impl.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies/domain/utils/hooks/use_navigation.dart';

@singleton
class LoginController {
  final AuthInterfaceImpl _authImpl;
  final UserInterfaceImpl _userImpl;

  LoginController(this._authImpl, this._userImpl);

  late TextEditingController emailController;
  late TextEditingController passwordController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  void init(BuildContext context) {
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  Future<void> sigInGoogle(BuildContext context) async {
    isLoading.value = true;
    final UserCredential? userCredential = await _authImpl.sigInGoogle();

    if (userCredential != null) {
      final UserModel data = UserModel(
        cellPhone: "",
        createdAt: DateTime.now(),
        displayName: userCredential.user?.displayName ?? '',
        email: userCredential.user?.email ?? '',
        isActive: true,
        fcmToken: userCredential.credential!.accessToken,
        photo: userCredential.user!.photoURL,
      );
      await _userImpl.createUser(userCredential.user!.uid, data.toJson());
    }
    isLoading.value = false;
    useNavigateReplacePage(context: context, route: '/main');
  }

  void setUser({required BuildContext context, required UserModel user}) {
    ProfileActions.setUser(context: context, user: user);
  }

  void dispose() {
    isLoading.value = false;
    emailController.dispose();
    passwordController.dispose();
  }
}
