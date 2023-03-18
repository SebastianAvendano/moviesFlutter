part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}

class SetMovie extends FavoritesEvent {
  final MovieModel movie;
  const SetMovie(this.movie);

  @override
  List<Object> get props => [movie];
}