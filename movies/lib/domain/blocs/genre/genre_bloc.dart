import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/data/models/genre_response/genre_response.dart';

part 'genre_actions.dart';
part 'genre_event.dart';
part 'genre_state.dart';

class GenreBloc extends Bloc<GenreEvent, GenreState> {
  GenreBloc() : super(const GenreState()) {
    on<GenreEvent>((event, emit) {
      if (event is GenreEventSetGenres) {
        emit(state.copyWith(genres: event.genres, isLoading: false));
      }
    });
  }
}
