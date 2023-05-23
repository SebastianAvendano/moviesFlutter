// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:movies/data/enums/snack_bar_type_enum.dart';
import 'package:movies/data/enums/type_alert.enum.dart';
import 'package:movies/data/models/genre_response/genre_response.dart';
import 'package:movies/data/models/movie/movie_model.dart';
import 'package:movies/data/models/user/user_model.dart';
import 'package:movies/domain/blocs/genre/genre_bloc.dart';
import 'package:movies/domain/blocs/movie/movie_bloc.dart';
import 'package:movies/domain/blocs/profile/profile_bloc.dart';
import 'package:movies/domain/repositories/auth_repository/auth_impl.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/domain/repositories/movies_repository/movie_impl.dart';
import 'package:movies/domain/repositories/preferences_repository/preferences_impl.dart';
import 'package:movies/domain/utils/alert.dart';
import 'package:movies/domain/utils/hooks/use_navigation.dart';
import 'package:movies/ui/theme/colors_theme.dart';
import 'package:movies/ui/widgets/button.dart';
import 'package:movies/ui/widgets/snack_bar_alert_widget.dart';

@singleton
class HomeController {
  final AuthInterfaceImpl _authImpl;
  final MoviesImpl _movieImpl;
  final PreferencesImpl _preferencesImpl;

  HomeController(
    this._authImpl,
    this._movieImpl,
    this._preferencesImpl,
  );

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  void init(BuildContext context) {
    _getData(context: context);
  }

  void _getData({required BuildContext context}) async {
    await Future.wait([
      _getMovies(context: context),
      _getGenres(context: context),
    ]);
    isLoading.value = false;
  }

  Future<void> _getMovies({required BuildContext context}) async {
    final List<MovieModel> movies = await _movieImpl.getNowPlayingMovie();

    MovieActions.setMovies(context: context, movies: movies);
  }

  Future<void> _getGenres({required BuildContext context}) async {
    final List<Genre> genres = await _movieImpl.getGenreList();

    GenreActions.setGenres(context: context, genres: genres);
  }

  Future<void> onChangeGenre(
      {required BuildContext context, required int idGenre}) async {
    final List<MovieModel> movies = await _movieImpl.getMovieByGenre(idGenre);

    MovieActions.setMovies(context: context, movies: movies);
  }

  Future<void> logOut(BuildContext context) async {
    isLoading.value = true;

    Alert(
      context: context,
      title: 'Cerrar sesión',
      text: '¿Quieres salir de la app?',
      type: TypeAlertDialog.warning,
      buttons: [
        Button(
            label: 'Cerrar',
            borderRaidus: 6,
            height: 40,
            backgroundColor: ColorsAppTheme.blueColor,
            onPressed: () {
              _authImpl.signOut();
              ProfileActions.setUser(context: context, user: const UserModel());
              useNavigateReplacePage(context: context, route: "/login");
            }),
      ],
    ).show();
    isLoading.value = false;
    return;
  }

  void setFavoritre(BuildContext context, MovieModel movie) async {
    final user = ProfileActions.getCurrentState(context: context).user;

    final Map<String, dynamic> data = {
      "movie": movie.toJson(),
      "user": user.reference,
    };

    final bool response = await _preferencesImpl.setFavorite(data, movie.id!);

    if (response) {
      SnackBarFloating.show(
        context: context,
        snackBarType: SnackBarType.success,
        message: "pelicula guardada",
      );
      return;
    }
    SnackBarFloating.show(
      context: context,
      snackBarType: SnackBarType.error,
      message: "Ocurrió un error, intenta nuevamente!",
    );
    return;
  }

  void removeFavoritre(BuildContext context, MovieModel movie) async {
    final bool response = await _preferencesImpl.removeFavorite(movie.id!);

    if (response) {
      SnackBarFloating.show(
        context: context,
        snackBarType: SnackBarType.success,
        message: "pelicula eliminada",
      );
      return;
    }
    SnackBarFloating.show(
      context: context,
      snackBarType: SnackBarType.error,
      message: "Ocurrió un error, intenta nuevamente!",
    );
    return;
  }

  void dispose() {
    isLoading.value = false;
  }
}
