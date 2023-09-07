part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class ProfileStarted extends ProfileEvent {
  final String? accessToken;

  ProfileStarted(this.accessToken);
}

class ProfileAuthChangedInfo extends ProfileEvent {
  final String? accessToken;

  ProfileAuthChangedInfo(this.accessToken);
}
