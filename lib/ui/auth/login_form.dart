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
        padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
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
                          child: const Text("Login as Studnent"))
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
                          child: const Text("Login as Agent"))
                    ],
                  ),
            const SizedBox(height: 24),
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
            const SizedBox(height: 16),
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
                  const Text("Forgot your password?"),
                  const SizedBox(width: 10),
                  TextButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(StudentAuthStarted(
                          isLoginMode: false, isForgotPass: true));
                    },
                    child: const Text('Reset Email'),
                  ),
                ],
              ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16))),
                  backgroundColor: MaterialStatePropertyAll(
                      Theme.of(context).colorScheme.primary),
                  fixedSize: const MaterialStatePropertyAll(Size(200, 50))),
              child: const Text('Login'),
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
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                const SizedBox(width: 10),
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
                  child: const Text('Sign Up'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
