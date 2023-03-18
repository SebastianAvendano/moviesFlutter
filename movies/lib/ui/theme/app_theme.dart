import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors_theme.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    fontFamily: 'inter',
    primaryColor: ColorsAppTheme.balck_1,
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
    colorScheme: const ColorScheme.dark().copyWith(
      brightness: Brightness.dark,
      secondary: Colors.white,
    ),
  );
}