part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class StudentAuthStarted extends AuthEvent {
  final bool isLoginMode;
  final bool isForgotPass;

  StudentAuthStarted({required this.isLoginMode, required this.isForgotPass});
}

class StudentAuthLoginBtnClicked extends AuthEvent {
  final String email;
  final String password;

  StudentAuthLoginBtnClicked(this.email, this.password);
}

class StudentAuthRegisterBtnClicked extends AuthEvent {
  final String fullName;
  final String email;
  final String gender;
  final String phone;
  final String password;

  StudentAuthRegisterBtnClicked(
      {required this.email,
      required this.password,
      required this.fullName,
      required this.gender,
      required this.phone});
}

class StudentAuthForgotPassBtnClicked extends AuthEvent {
  final String email;

  StudentAuthForgotPassBtnClicked(this.email);
}

class AgentAuthStarted extends AuthEvent {
  final bool isLoginMode;
  final bool isForgotPass;

  AgentAuthStarted({required this.isLoginMode, required this.isForgotPass});
}

class AgentAuthLoginBtnClicked extends AuthEvent {
  final String email;
  final String password;

  AgentAuthLoginBtnClicked(this.email, this.password);
}

class AgentAuthRegisterBtnClicked extends AuthEvent {
  final String fullName;
  final String email;
  final String organization;
  final String phone;
  final String password;

  AgentAuthRegisterBtnClicked(
      {required this.fullName,
      required this.email,
      required this.password,
      required this.organization,
      required this.phone});
}

class AgentAuthForgotPassBtnClicked extends AuthEvent {
  final String email;

  AgentAuthForgotPassBtnClicked(this.email);
}
