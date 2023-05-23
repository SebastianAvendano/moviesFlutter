// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:movies/data/models/movie/movie_model.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/domain/blocs/movie/movie_bloc.dart';
import 'package:movies/domain/repositories/movies_repository/movie_impl.dart';

@singleton
class SearchController {
  final MoviesImpl _movieImpl;

  SearchController(
    this._movieImpl,
  );

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  Future<void> searchMovies(
      {required BuildContext context, required String query}) async {
    final List<MovieModel> movies = await _movieImpl.searchMovies(query);

    MovieActions.setMovies(context: context, movies: movies);
  }

  void dispose() {
    isLoading.value = false;
  }
}
