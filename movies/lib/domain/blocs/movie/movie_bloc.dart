import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/data/models/movie/movie_model.dart';

part 'movie_actions.dart';
part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(const MovieState()) {
    on<MovieEvent>((event, emit) {
      if (event is MovieEventSetMovies) {
        emit(
          state.copyWith(
            movies: event.movies,
            isLoading: false,
          ),
        );
      }
      if (event is MovieEventSetMovieSelected) {
        emit(state.copyWith(
          selectedMovie: event.selectedMovie,
          isLoading: false,
        ));
      }
    });
  }
}
