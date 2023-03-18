import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movies/data/models/movie/movie_model.dart';
import 'package:movies/ui/blocs/movie/movie_bloc.dart';
import 'package:movies/ui/blocs/movie/movie_event.dart';
import 'package:movies/ui/blocs/movie/movie_state.dart';
import 'package:movies/ui/widgets/activity_indicator.dart';
import 'package:movies/ui/widgets/app_bar.dart';

import 'widgets/list_genre.dart';
import 'widgets/movie_slider.dart';

final injector = GetIt.instance;
final controller = injector.get<MovieBloc>();

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieBloc>(
          create: (_) => controller..add(const MovieEventStarted(0, '')),
        ),
      ],
      child: Scaffold(
          appBar: const CustomAppBar(
        title: Text(
          "Movies",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 26,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.account_circle),
          ),
        ],
      ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _builCarousel(),
                  const SizedBox(height: 15,),
                  const ListGenres(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  BlocBuilder<MovieBloc, MovieState> _builCarousel() {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        if (state is MovieLoading) {
          return const Center(
            child: ActivityIndicator(),
          );
        } else if (state is MovieLoaded) {
          List<MovieModel> movies = state.movieList;
          return MovieSlider(movies: movies);
        }
        return Container();
      },
    );
  }
}
