import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/data/models/user/user_model.dart';

part 'profile_actions.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileState()) {
    on<ProfileEvent>((event, emit) {
      if (event is ProfileEventSetUser) {
        emit(state.copyWith(user: event.user, isLoading: false));
      }
    });
  }
}
