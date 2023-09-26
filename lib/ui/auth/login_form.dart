import 'package:applycamp/ui/auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  bool isAgent;

  LoginForm({super.key, this.isAgent = true});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
        child: Column(
          children: [
            Image.asset("assets/img/applycamp_logo.png", width: 170),
            widget.isAgent
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Agent Login |",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontSize: 20)),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              widget.isAgent = !widget.isAgent;
                            });
                          },
                          child: Text("Login as Studnent"))
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Student Login |",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontSize: 20)),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              widget.isAgent = !widget.isAgent;
                            });
                          },
                          child: Text("Login as Agent"))
                    ],
                  ),
            SizedBox(height: 24),
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
            if (widget.isAgent == false)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Forgot your password?"),
                  SizedBox(width: 10),
                  TextButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(StudentAuthStarted(
                          isLoginMode: false, isForgotPass: true));
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
                if (widget.isAgent) {
                  context.read<AuthBloc>().add(AgentAuthLoginBtnClicked(
                      _emailController.text, _passwordController.text));
                } else {
                  context.read<AuthBloc>().add(StudentAuthLoginBtnClicked(
                      _emailController.text, _passwordController.text));
                }
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
                    if (widget.isAgent) {
                      context.read<AuthBloc>().add(AgentAuthStarted(
                          isLoginMode: false, isForgotPass: false));
                    } else {
                      context.read<AuthBloc>().add(StudentAuthStarted(
                          isLoginMode: false, isForgotPass: false));
                    }
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
