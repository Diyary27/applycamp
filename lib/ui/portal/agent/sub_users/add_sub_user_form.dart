import 'package:applycamp/domain/entity/sub_user.dart';
import 'package:flutter/material.dart';

class SubUserForm extends StatefulWidget {
  const SubUserForm({super.key, this.subUserEntity});

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
                  decoration: const InputDecoration(
                    label: Text('Name'),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    label: Text('Email'),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _passController,
                  decoration: const InputDecoration(
                    label: Text('Password'),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _organizationController,
                  decoration: const InputDecoration(
                    label: Text('Organization'),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    label: Text('Phone'),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _commissionController,
                  decoration: const InputDecoration(
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
                    const Text(
                      'Can View Commissions',
                    ),
                  ],
                ),
                //
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Upload Profile Photo'),
                ),
                const SizedBox(height: 30),
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
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.green),
                        ),
                        child: const Text('Add Sub User'),
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
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.green),
                        ),
                        child: const Text('Edit Sub User'),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
