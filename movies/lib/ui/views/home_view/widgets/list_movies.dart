import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/data/models/movie/movie_model.dart';
import 'package:movies/domain/blocs/movie/movie_bloc.dart';
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
        if (state.isLoading) {
          const ActivityIndicator();
        } else if (state.movies.isNotEmpty) {
          List<MovieModel> movies = state.movies;
          return Flexible(
            flex: 1,
            child: GridListMovies(
              movies: movies,
            ),
          );
        }
        return Container();
      },
    );
  }
}
