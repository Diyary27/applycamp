part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class StudentAuthRegisterLoaded extends AuthState {}

class StudentAuthLoginLoaded extends AuthState {}

class StudentAuthForgotPassLoaded extends AuthState {}

class StudentAuthForgotPassEmailSent extends AuthState {
  final String response;

  StudentAuthForgotPassEmailSent(this.response);
}

class StudentAuthLoginSuccess extends AuthState {
  final StudentAuthResponse loginResponse;

  StudentAuthLoginSuccess(this.loginResponse);
}

class StudentAuthRegisterSuccess extends AuthState {
  final StudentAuthResponse registerResponse;

  StudentAuthRegisterSuccess(this.registerResponse);
}

class AgentAuthInitial extends AuthState {}

class AgentAuthRegisterLoaded extends AuthState {}

class AgentAuthLoginLoaded extends AuthState {}

class AgentAuthForgotPassLoaded extends AuthState {}

class AgentAuthForgotPassEmailSent extends AuthState {
  final String response;

  AgentAuthForgotPassEmailSent(this.response);
}

class AgentAuthLoginSuccess extends AuthState {
  final UserAuthResponse loginResponse;

  AgentAuthLoginSuccess(this.loginResponse);
}

class AgentAuthRegisterSuccess extends AuthState {
  final UserAuthResponse registerResponse;

  AgentAuthRegisterSuccess(this.registerResponse);
}

class AuthError extends AuthState {
  final String error;

  AuthError(this.error);
}
