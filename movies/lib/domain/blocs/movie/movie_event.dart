part of 'movie_bloc.dart';

@immutable
abstract class MovieEvent {}

class MovieEventSetMovies extends MovieEvent {
  final List<MovieModel> movies;
  MovieEventSetMovies(this.movies);
}

class MovieEventSetMovieSelected extends MovieEvent {
  final MovieModel selectedMovie;
  MovieEventSetMovieSelected(this.selectedMovie);
}
