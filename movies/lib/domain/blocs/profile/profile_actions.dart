part of 'profile_bloc.dart';

class ProfileActions {
  static ProfileState getCurrentState({required BuildContext context}) =>
      context.read<ProfileBloc>().state;

  static void setUser({
    required BuildContext context,
    UserModel user = const UserModel(),
  }) {
    context.read<ProfileBloc>().add(ProfileEventSetUser(user));
  }
}
