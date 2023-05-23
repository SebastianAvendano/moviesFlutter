part of 'genre_bloc.dart';

class GenreActions {
  static GenreState getCurrentState({required BuildContext context}) =>
      context.read<GenreBloc>().state;

  static void setGenres({
    required BuildContext context,
    List<Genre> genres = const [],
  }) {
    context.read<GenreBloc>().add(GenreEventSetGenres(genres));
  }
}
