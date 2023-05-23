import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:movies/ui/theme/colors_theme.dart';
import 'package:movies/ui/views/login_view/login_controller.dart';
import 'package:movies/ui/widgets/activity_indicator.dart';
import 'package:movies/ui/widgets/button.dart';

final injector = GetIt.instance;

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final LoginController controller = injector.get<LoginController>();

  @override
  void initState() {
    super.initState();
    controller.init(context);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(20),
      child: ValueListenableBuilder(
        valueListenable: controller.isLoading,
        builder: (BuildContext _, bool isLoading, Widget? child) {
          return isLoading ? const ActivityIndicator() : child!;
        },
        child: Button(
          label: 'Iniciar sesion',
          backgroundColor: ColorsAppTheme.blueColor.withOpacity(.6),
          onPressed: () => controller.sigInGoogle(context),
        ),
      ),
    );
  }
}
