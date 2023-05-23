part of 'movie_bloc.dart';

class MovieActions {
  static MovieState getCurrentState({required BuildContext context}) =>
      context.read<MovieBloc>().state;

  static void setMovies({
    required BuildContext context,
    List<MovieModel> movies = const [],
  }) {
    context.read<MovieBloc>().add(MovieEventSetMovies(movies));
  }

  static void setMovieSelected({
    required BuildContext context,
    required MovieModel selectedMovie,
  }) {
    context.read<MovieBloc>().add(MovieEventSetMovieSelected(selectedMovie));
  }
}
