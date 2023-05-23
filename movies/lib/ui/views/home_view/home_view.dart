import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movies/domain/blocs/movie/movie_bloc.dart';
import 'package:movies/domain/blocs/profile/profile_bloc.dart';
import 'package:movies/ui/views/home_view/home_controller.dart';
import 'package:movies/ui/widgets/activity_indicator.dart';
import 'package:movies/ui/widgets/app_bar.dart';

import 'widgets/list_genre.dart';
import 'widgets/movie_slider.dart';

final injector = GetIt.instance;

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeController = injector.get<HomeController>();
  @override
  void initState() {
    homeController.init(context);
    super.initState();
  }

  @override
  void dispose() {
    homeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = ProfileActions.getCurrentState(context: context).user;
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          user.displayName!.isNotEmpty
              ? "${user.displayName!.split(' ')[0]} ${user.displayName!.split(' ')[1]}"
              : "movies",
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
              onPressed: () => homeController.logOut(context),
              icon: const Icon(Icons.account_circle),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _builCarousel(),
          const SizedBox(
            height: 15,
          ),
          const ListGenres(),
        ],
      ),
    );
  }

  Widget _builCarousel() {
    return ValueListenableBuilder(
      valueListenable: homeController.isLoading,
      builder: (BuildContext _, bool isLoading, Widget? child) => child!,
      child: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: ActivityIndicator(),
            );
          }
          final movies = state.movies;
          return MovieSlider(movies: movies);
        },
      ),
    );
  }
}
