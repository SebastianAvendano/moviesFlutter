import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/data/models/movie/movie_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

final injector = GetIt.instance;
SharedPreferences get _preferences => injector.get<SharedPreferences>();

@injectable
class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
List<MovieModel> list = [];
  FavoritesBloc() : super(FavoritesLoading()) {
    on<SetMovie>((event, emit) async {
      FavoritesLoading();
      emit(FavoritesLoaded(list));
    });
  }
}