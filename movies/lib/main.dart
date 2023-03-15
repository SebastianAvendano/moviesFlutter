import 'package:flutter/material.dart';

// Theme project
import 'presentation/theme/app_theme.dart';

//Config project
import 'package:movies/dependency_injection/initial_config.dart';

// Routes
import 'package:movies/presentation/router.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initalConfig();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      onGenerateRoute: RouterGenerator.generateRoute,
      initialRoute: '/',
    );
  }
}