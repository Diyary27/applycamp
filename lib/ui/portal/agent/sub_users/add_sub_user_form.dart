import 'package:applycamp/domain/entity/sub_user.dart';
import 'package:applycamp/ui/portal/agent/sub_users/bloc/sub_users_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubUserForm extends StatefulWidget {
  SubUserForm({super.key, this.subUserEntity});

  final SubUserEntity? subUserEntity;

  @override
  State<SubUserForm> createState() => _SubUserFormState();
}

class _SubUserFormState extends State<SubUserForm> {
  @override
  void initState() {
    _nameController.text = widget.subUserEntity!.name;
    _emailController.text = widget.subUserEntity!.email;
    _organizationController.text = widget.subUserEntity!.organization;
    _phoneController.text = widget.subUserEntity!.phone;
    _commissionController.text =
        widget.subUserEntity!.commissionPercentage.toString();
    _canViewCommissions = widget.subUserEntity!.canViewCommissions;
    _canAddSubUsers = widget.subUserEntity!.canAddSubUsers;
    super.initState();
  }

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passController = TextEditingController();

  final TextEditingController _organizationController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _commissionController = TextEditingController();

  bool _canViewCommissions = false;

  bool _canAddSubUsers = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    label: Text('Name'),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    label: Text('Email'),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _passController,
                  decoration: InputDecoration(
                    label: Text('Password'),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _organizationController,
                  decoration: InputDecoration(
                    label: Text('Organization'),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    label: Text('Phone'),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _commissionController,
                  decoration: InputDecoration(
                    label: Text('Commision Percentage'),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _canViewCommissions,
                      onChanged: (newValue) {
                        setState(() {
                          _canViewCommissions = newValue!;
                        });
                      },
                    ),
                    Text(
                      'Can View Commissions',
                      style: Theme.of(context).inputDecorationTheme.hintStyle,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _canAddSubUsers,
                      onChanged: (newValue) {
                        setState(() {
                          _canAddSubUsers = newValue!;
                        });
                      },
                    ),
                    Text(
                      'Can View Commissions',
                    ),
                  ],
                ),
                //
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Upload Profile Photo'),
                ),
                SizedBox(height: 30),
                widget.subUserEntity == null
                    ? ElevatedButton(
                        onPressed: () {
                          final SubUserEntity subUserEntity = SubUserEntity(
                            name: _nameController.text,
                            password: _passController.text,
                            email: _emailController.text,
                            organization: _organizationController.text,
                            phone: _phoneController.text,
                            commissionPercentage:
                                int.parse(_commissionController.text),
                            canViewCommissions: _canViewCommissions,
                            canAddSubUsers: _canAddSubUsers,
                          );
                          Navigator.of(context).pop(subUserEntity);
                        },
                        child: Text('Add Sub User'),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.green),
                        ),
                      )
                    : ElevatedButton(
                        onPressed: () {
                          final SubUserEntity subUserEntity = SubUserEntity(
                            name: _nameController.text,
                            password: _passController.text,
                            email: _emailController.text,
                            organization: _organizationController.text,
                            phone: _phoneController.text,
                            commissionPercentage:
                                int.parse(_commissionController.text),
                            canViewCommissions: _canViewCommissions,
                            canAddSubUsers: _canAddSubUsers,
                          );
                          Navigator.of(context).pop(subUserEntity);
                        },
                        child: Text('Edit Sub User'),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.green),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
