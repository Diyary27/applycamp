import 'package:applycamp/di/service_locator.dart';
import 'package:applycamp/ui/auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterForm extends StatefulWidget {
  bool isAgent;
  RegisterForm({super.key, this.isAgent = true});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController _firstNameController = TextEditingController();

  final TextEditingController _lastNameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _organizationController = TextEditingController();

  var _genderController = "male";

  List<DropdownMenuItem> genders = [
    DropdownMenuItem(child: Text('Male'), value: "male"),
    DropdownMenuItem(child: Text('Female'), value: "female"),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
        child: Column(
          children: [
            Image.asset("assets/img/applycamp_logo.png", width: 160),
            // if student or agent
            widget.isAgent
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Agent Register |",
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
                          child: Text("Register as Studnent"))
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Student Register |",
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
                          child: Text("Register as Agent"))
                    ],
                  ),
            SizedBox(height: 24),
            TextField(
              controller: _firstNameController,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                label: Text(
                  'First Name',
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
              controller: _lastNameController,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                label: Text(
                  'Last Name',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: Theme.of(context).colorScheme.surface),
                ),
                filled: true,
              ),
            ),
            SizedBox(height: 16),
            // if student dont show it
            if (widget.isAgent == false)
              DropdownButtonFormField(
                  value: _genderController,
                  items: genders,
                  decoration: InputDecoration(
                      label: Text(
                    'Gender',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: Theme.of(context).colorScheme.surface),
                  )),
                  onChanged: (dynamic) {
                    setState(() {
                      _genderController = dynamic;
                    });
                  }),
            // if agent show the organization
            if (widget.isAgent)
              TextField(
                controller: _organizationController,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  label: Text(
                    'Organization',
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
              controller: _phoneController,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                label: Text(
                  'Phone Number',
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
            SizedBox(height: 32),
            ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16))),
                  backgroundColor: MaterialStatePropertyAll(
                      Theme.of(context).colorScheme.primary),
                  fixedSize: MaterialStatePropertyAll(Size(200, 50))),
              child: Text('Register'),
              onPressed: () async {
                var _fullName =
                    _firstNameController.text + " " + _lastNameController.text;

                if (widget.isAgent) {
                  context.read<AuthBloc>().add(AgentAuthRegisterBtnClicked(
                        email: _emailController.text,
                        fullName: _fullName,
                        organization: _organizationController.text,
                        password: _passwordController.text,
                        phone: _phoneController.text,
                      ));
                } else {
                  context.read<AuthBloc>().add(StudentAuthRegisterBtnClicked(
                        email: _emailController.text,
                        fullName: _fullName,
                        gender: _genderController,
                        password: _passwordController.text,
                        phone: _phoneController.text,
                      ));
                }
              },
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Have an account?"),
                SizedBox(width: 10),
                TextButton(
                  onPressed: () {
                    if (widget.isAgent) {
                      context.read<AuthBloc>().add(AgentAuthStarted(
                          isLoginMode: true, isForgotPass: false));
                    } else {
                      context.read<AuthBloc>().add(StudentAuthStarted(
                          isLoginMode: true, isForgotPass: false));
                    }
                  },
                  child: Text('Sign In'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
