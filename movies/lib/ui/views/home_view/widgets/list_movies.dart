import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/data/models/movie/movie_model.dart';
import 'package:movies/ui/blocs/movie/movie_bloc.dart';
import 'package:movies/ui/blocs/movie/movie_state.dart';
import 'package:movies/ui/widgets/activity_indicator.dart';
import 'package:movies/ui/widgets/grid_list_movies.dart';

class ListMovies extends StatelessWidget {
  const ListMovies({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        if (state is MovieLoading) {
          const ActivityIndicator();
        } else if (state is MovieLoaded) {
          List<MovieModel> movies = state.movieList;
          return GridListMovies(movies: movies, size: 390,);
        }
        return Container();
      },
    );
  }
}

