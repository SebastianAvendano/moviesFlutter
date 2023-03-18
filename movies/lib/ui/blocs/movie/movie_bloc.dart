import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/data/models/movie/movie_model.dart';
import 'package:movies/data/repositories/movie_impl.dart';
import 'package:movies/ui/blocs/movie/movie_event.dart';
import 'package:movies/ui/blocs/movie/movie_state.dart';

@injectable
class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MoviesImpl movieImpl;

  MovieBloc(this.movieImpl) : super(MovieLoading()) {
    on<MovieEventStarted>((event, emit) async {
      List<MovieModel> movieList;

      MovieLoading();

      if (event.movieId == 0) {
        movieList = await movieImpl.getNowPlayingMovie();
      } else {
        movieList = await movieImpl.getMovieByGenre(event.movieId);
      }

      emit(MovieLoaded(movieList));
    });
  }
}
