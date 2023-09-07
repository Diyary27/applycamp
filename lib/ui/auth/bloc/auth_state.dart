part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthRegisterLoaded extends AuthState {}

class AuthLoginLoaded extends AuthState {}

class AuthForgotPassLoaded extends AuthState {}

class AuthForgotPassEmailSent extends AuthState {
  final String response;

  AuthForgotPassEmailSent(this.response);
}

class AuthLoginSuccess extends AuthState {
  final StudentAuthResponse loginResponse;

  AuthLoginSuccess(this.loginResponse);
}

class AuthRegisterSuccess extends AuthState {
  final StudentAuthResponse registerResponse;

  AuthRegisterSuccess(this.registerResponse);
}

class AuthError extends AuthState {
  final String error;

  AuthError(this.error);
}
