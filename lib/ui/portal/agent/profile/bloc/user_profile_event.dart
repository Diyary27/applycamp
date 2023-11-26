part of 'user_profile_bloc.dart';

abstract class UserProfileEvent {}

class UserProfileStarted extends UserProfileEvent {}

class UserProfileUpdateClicked extends UserProfileEvent {
  final String name;
  final String organization;
  final String phone;
  final String password;
  final UploadedImage uploadedImage;

  UserProfileUpdateClicked({
    required this.name,
    required this.organization,
    required this.phone,
    required this.password,
    required this.uploadedImage,
  });
}
