part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AuthStarted extends AuthEvent {
  final bool isLoginMode;
  final bool isForgotPass;

  AuthStarted({required this.isLoginMode, required this.isForgotPass});
}

class AuthLoginBtnClicked extends AuthEvent {
  final String email;
  final String password;

  AuthLoginBtnClicked(this.email, this.password);
}

class AuthRegisterBtnClicked extends AuthEvent {
  final String fullName;
  final String email;
  final String gender;
  final String phone;
  final String password;

  AuthRegisterBtnClicked(
      this.email, this.password, this.fullName, this.gender, this.phone);
}

class AuthForgotPassBtnClicked extends AuthEvent {
  final String email;

  AuthForgotPassBtnClicked(this.email);
}
