part of 'user_profile_bloc.dart';

abstract class UserProfileState {}

class UserProfileInitial extends UserProfileState {}

class UserProfilLoaded extends UserProfileState {
  final User user;

  UserProfilLoaded(this.user);
}
