part of 'favorites_bloc.dart';

abstract class FavoritesState extends Equatable {
   const FavoritesState();

  @override
  List<Object> get props => [];
}

class FavoritesLoading extends FavoritesState {}

class FavoritesLoaded extends FavoritesState {
  final List<MovieModel> movieList;
  const FavoritesLoaded(this.movieList);

  @override
  List<Object> get props => [movieList];
}

class FavoritesError extends FavoritesState {}