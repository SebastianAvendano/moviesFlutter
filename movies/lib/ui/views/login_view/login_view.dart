import 'package:flutter/material.dart';
import 'widgets/login_background.dart';

import 'widgets/form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: LoginBackground(
        child: Padding(
          padding: EdgeInsets.only(top: size.height * .85),
          child: const FormLogin(),
        ),
      ),
    );
  }
}
