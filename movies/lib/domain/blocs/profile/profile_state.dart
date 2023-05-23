part of 'profile_bloc.dart';

class ProfileState {
  final bool isLoading;
  final UserModel user;

  const ProfileState({
    this.isLoading = true,
    this.user = const UserModel(),
  });

  ProfileState copyWith({
    bool? isLoading,
    UserModel? user,
  }) =>
      ProfileState(
        user: user ?? this.user,
        isLoading: isLoading ?? this.isLoading,
      );
}
