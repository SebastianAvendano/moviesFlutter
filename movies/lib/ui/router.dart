import 'package:flutter/material.dart';
import 'package:movies/ui/views/login_view/login_view.dart';

import 'views/detail_movie_view/movie_detail_view.dart';
import 'views/main_view/main_view.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final routesMap = {
      '/': MaterialPageRoute(
        builder: (_) => const MainView(),
      ),
      '/login': MaterialPageRoute(
        builder: (_) => const LoginView(),
      ),
      '/details': MaterialPageRoute(
        builder: (_) => const DetailView(),
      ),
    };

    return routesMap[settings.name!] ?? routesMap['/']!;
  }
}
