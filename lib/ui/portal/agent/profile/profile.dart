import 'package:applycamp/ui/portal/agent/darwer.dart';
import 'package:applycamp/ui/portal/agent/profile/bloc/user_profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PortalProfilePage extends StatelessWidget {
  PortalProfilePage({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _organizationController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
      ),
      drawer: const AgentDrawer(),
      body: BlocProvider<UserProfileBloc>(
        create: (context) {
          final bloc = UserProfileBloc();
          bloc.add(UserProfileStarted());
          bloc.stream.listen(
            (state) {
              if (state is UserProfileUpdateSuccess) {
                bloc.add(UserProfileStarted());
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Profile Updated Successfully')),
                );
              }
            },
          );
          return bloc;
        },
        child: BlocBuilder<UserProfileBloc, UserProfileState>(
          builder: (context, state) {
            if (state is UserProfileInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is UserProfilLoaded) {
              _nameController.text = state.user.name;
              _organizationController.text = state.user.organization;
              _phoneController.text = state.user.phone;
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // avatar
                      const Center(
                        child: CircleAvatar(
                          minRadius: 55,
                          maxRadius: 55,
                          backgroundImage: NetworkImage(
                            'https://wisehealthynwealthy.com/wp-content/uploads/2022/01/CreativecaptionsforFacebookprofilepictures.jpg',
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Upload Photo'),
                        ),
                      ),
                      const SizedBox(height: 24),
                      TextField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          label: Text('Name'),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _organizationController,
                        decoration: const InputDecoration(
                          label: Text('Organization'),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _phoneController,
                        decoration: const InputDecoration(
                          label: Text('Phone'),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          label: Text('Password'),
                          helperText:
                              'dont write anything if you want it unchanged',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<UserProfileBloc>().add(
                                UserProfileUpdateClicked(
                                    name: _nameController.text,
                                    organization: _organizationController.text,
                                    phone: _phoneController.text,
                                    password: _passwordController.text));
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                const MaterialStatePropertyAll(Colors.green),
                            minimumSize: MaterialStatePropertyAll(
                                Size(MediaQuery.of(context).size.width, 50)),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                          ),
                          child: const Text('Update'),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Text(state.toString());
            }
          },
        ),
      ),
    );
  }
}
