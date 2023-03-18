import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/data/models/movie/movie_model.dart';

part 'detail_event.dart';

class DetailBloc extends Bloc<DetailEvent, MovieModel> {
  DetailBloc() : super(MovieModel()) {
    on<DetailEventStarted>((event, emit) => emit(event.movie));
  }
}
