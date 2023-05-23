
part of 'genre_bloc.dart';

@immutable
abstract class GenreEvent {}

class GenreEventSetGenres extends GenreEvent {
  final List<Genre> genres;
  GenreEventSetGenres(this.genres);
}
