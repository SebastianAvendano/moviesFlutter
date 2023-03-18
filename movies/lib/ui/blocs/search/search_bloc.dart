import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/data/models/movie/movie_model.dart';
import 'package:movies/data/repositories/movie_impl.dart';

part 'search_event.dart';
part 'search_state.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final MoviesImpl movieImpl;
  SearchBloc(this.movieImpl) : super(SearchLoading()) {
    on<SearchEventStarted>((event, emit) async {
      List<MovieModel> movieList;

      SearchLoading();

      if (event.query.isNotEmpty) {
        movieList = await movieImpl.searchMovies(event.query);
      } else {
        movieList = [];
      }
      emit(SearchLoaded(movieList));
    });
  }
}
