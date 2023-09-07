import 'package:applycamp/ui/auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
        child: Column(
          children: [
            Image.asset("assets/img/applycamp_logo.png", width: 170),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                label: Text(
                  'email',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: Theme.of(context).colorScheme.surface),
                ),
                filled: true,
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                label: Text(
                  'Password',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: Theme.of(context).colorScheme.surface),
                ),
                filled: true,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Forgot your password?"),
                SizedBox(width: 10),
                TextButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(
                        AuthStarted(isLoginMode: false, isForgotPass: true));
                  },
                  child: Text('Reset Email'),
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16))),
                  backgroundColor: MaterialStatePropertyAll(
                      Theme.of(context).colorScheme.primary),
                  fixedSize: MaterialStatePropertyAll(Size(200, 50))),
              child: Text('Login'),
              onPressed: () async {
                context.read<AuthBloc>().add(AuthLoginBtnClicked(
                    _emailController.text, _passwordController.text));
              },
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                SizedBox(width: 10),
                TextButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(
                        AuthStarted(isLoginMode: false, isForgotPass: false));
                  },
                  child: Text('Sign Up'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
