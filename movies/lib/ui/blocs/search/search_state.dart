part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
   const SearchState();

  @override
  List<Object> get props => [];
}


class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<MovieModel> movieList;
  const SearchLoaded(this.movieList);

  @override
  List<Object> get props => [movieList];
}

class MovieError extends SearchState {}