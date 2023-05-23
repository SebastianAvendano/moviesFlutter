part of 'genre_bloc.dart';

class GenreState {
  final bool isLoading;
  final List<Genre> genres;

  const GenreState({
    this.isLoading = true,
    this.genres = const [],
  });

  GenreState copyWith({
    bool? isLoading,
    List<Genre>? genres,
  }) =>
      GenreState(
        genres: genres ?? this.genres,
        isLoading: isLoading ?? this.isLoading,
      );
}
