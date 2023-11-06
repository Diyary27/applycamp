import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/auth_bloc.dart';

class ForgotPassForm extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  ForgotPassForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
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
            const SizedBox(height: 32),
            ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16))),
                  backgroundColor: MaterialStatePropertyAll(
                      Theme.of(context).colorScheme.primary),
                  fixedSize: const MaterialStatePropertyAll(Size(200, 50))),
              child: const Text('Send Email'),
              onPressed: () async {
                context.read<AuthBloc>().add(
                    StudentAuthForgotPassBtnClicked(_emailController.text));
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
                    context.read<AuthBloc>().add(StudentAuthStarted(
                        isLoginMode: false, isForgotPass: false));
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
