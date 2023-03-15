import 'package:flutter/material.dart';
import 'package:movies/presentation/pages/home/home_page.dart';


class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final routesMap = {
      '/': MaterialPageRoute(
        builder: (_) => const HomeView(),
      ),
    };

    return routesMap[settings.name!] ?? routesMap['/']!;
  }
}