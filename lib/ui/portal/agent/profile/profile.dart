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
        title: Text('My Profile'),
      ),
      drawer: AgentDrawer(),
      body: BlocProvider<UserProfileBloc>(
        create: (context) {
          final bloc = UserProfileBloc();
          bloc.add(UserProfileStarted());
          bloc.stream.listen(
            (state) {
              if (state is UserProfileUpdateSuccess) {
                bloc.add(UserProfileStarted());
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Profile Updated Successfully')),
                );
              }
            },
          );
          return bloc;
        },
        child: BlocBuilder<UserProfileBloc, UserProfileState>(
          builder: (context, state) {
            if (state is UserProfileInitial) {
              return Center(child: CircularProgressIndicator());
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
                      Center(
                        child: CircleAvatar(
                          minRadius: 55,
                          maxRadius: 55,
                          backgroundImage: NetworkImage(
                            'https://wisehealthynwealthy.com/wp-content/uploads/2022/01/CreativecaptionsforFacebookprofilepictures.jpg',
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('Upload Photo'),
                        ),
                      ),
                      SizedBox(height: 24),
                      TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          label: Text('Name'),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        controller: _organizationController,
                        decoration: InputDecoration(
                          label: Text('Organization'),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                          label: Text('Phone'),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          label: Text('Password'),
                          helperText:
                              'dont write anything if you want it unchanged',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 16),
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
                          child: Text('Update'),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.green),
                            minimumSize: MaterialStatePropertyAll(
                                Size(MediaQuery.of(context).size.width, 50)),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                          ),
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
