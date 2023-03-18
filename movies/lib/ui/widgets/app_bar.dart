import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final double? elevation;
  final bool? centerTitle;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;

  const CustomAppBar({
    Key? key,
    this.title,
    this.bottom,
    this.centerTitle,
    this.elevation = 0,
    this.actions = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      bottom: bottom,
      actions: actions,
      elevation: elevation,
      centerTitle: centerTitle,
      iconTheme: const IconThemeData(color: Colors.white),
      backgroundColor: ThemeData.dark().scaffoldBackgroundColor,
      actionsIconTheme: const IconThemeData(color: Colors.white, size: 34),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}