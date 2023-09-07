import 'package:applycamp/di/service_locator.dart';
import 'package:applycamp/domain/repository/student_auth_repository.dart';
import 'package:applycamp/ui/auth/bloc/auth_bloc.dart';
import 'package:applycamp/ui/auth/forgot_pass_form.dart';
import 'package:applycamp/ui/auth/login_form.dart';
import 'package:applycamp/ui/auth/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthPage extends StatefulWidget {
  AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) {
            final bloc = AuthBloc(instance<StudentAuthRepository>());
            bloc.add(AuthStarted(isLoginMode: true, isForgotPass: false));
            bloc.stream.listen((state) {
              if (state is AuthRegisterSuccess) {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.registerResponse.message)));
              } else if (state is AuthLoginSuccess) {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.loginResponse.message)));
              } else if (state is AuthForgotPassEmailSent) {
                bloc.add(AuthStarted(isLoginMode: true, isForgotPass: false));
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.response)));
              }
            });
            return bloc;
          },
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthInitial) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  child: Center(child: CircularProgressIndicator()),
                );
              } else if (state is AuthRegisterLoaded) {
                return RegisterForm();
              } else if (state is AuthLoginLoaded) {
                return LoginForm();
              } else if (state is AuthForgotPassLoaded) {
                return ForgotPassForm();
              } else if (state is AuthError) {
                return Text(state.error);
              } else {
                return Text(state.toString());
              }
            },
          ),
        ),
      ),
    );
  }
}
