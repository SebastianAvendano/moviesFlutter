part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class ProfileEventSetUser extends ProfileEvent {
  final UserModel user;
  ProfileEventSetUser(this.user);
}
