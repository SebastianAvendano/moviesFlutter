import 'package:flutter/material.dart';
import 'package:movies/ui/widgets/activity_indicator.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
        body: Center(child: ActivityIndicator(),),
    );
}
}