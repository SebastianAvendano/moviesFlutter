import 'package:flutter/material.dart';
import 'package:movies/data/models/bottom_bar_model.dart';
import 'package:movies/ui/views/favorites_view/favorite_view.dart';
import 'package:movies/ui/views/home_view/home_view.dart';
import 'package:movies/ui/views/search_view/search_view.dart';

class MainStore {
  static const List<BottomBarModel> pages = [
    BottomBarModel(
      icon: Icons.home,
      label: 'Inicio',
      widget: HomeView(),
    ),
    BottomBarModel(
      icon: Icons.search,
      label: 'Buscar',
      widget: SearchView(),
    ),
    BottomBarModel(
      icon: Icons.favorite,
      label: 'Favoritos',
      widget: FavoritesView(),
    ),
  ];
}
