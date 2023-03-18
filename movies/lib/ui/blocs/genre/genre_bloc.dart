import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/data/models/genre_response/genre_response.dart';
import 'package:movies/data/repositories/movie_impl.dart';
import 'package:movies/ui/blocs/genre/genre_event.dart';
import 'package:movies/ui/blocs/genre/genre_state.dart';

@injectable
class GenreBloc extends Bloc<GenreEvent, GenreState> {
  final MoviesImpl movieImpl;
  GenreBloc(this.movieImpl) : super(GenreLoading()) {
    on<GenreEventStarted>((event, emit) async {
      GenreLoading();
      List<Genre> genreList = await movieImpl.getGenreList();

      emit(GenreLoaded(genreList));
    });
  }
}
