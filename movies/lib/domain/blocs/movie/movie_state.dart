part of 'movie_bloc.dart';

class MovieState {
  final bool isLoading;
  final List<MovieModel> movies;
  final MovieModel? selectedMovie;

  const MovieState({
    this.isLoading = true,
    this.movies = const [],
    this.selectedMovie,
  });

  MovieState copyWith({
    bool? isLoading,
    List<MovieModel>? movies,
    MovieModel? selectedMovie,
  }) =>
      MovieState(
        movies: movies ?? this.movies,
        isLoading: isLoading ?? this.isLoading,
        selectedMovie: selectedMovie ?? this.selectedMovie,
      );
}
