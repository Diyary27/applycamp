import 'dart:async';
import 'package:applycamp/di/service_locator.dart';
import 'package:applycamp/domain/repository/student_auth_repository.dart';
import 'package:applycamp/ui/auth/auth_page.dart';
import 'package:applycamp/ui/components/app_bar.dart';
import 'package:applycamp/ui/components/drawer.dart';
import 'package:applycamp/ui/profile/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ProfileBloc? profileBloc;
  StreamSubscription? stateStreamSubscription;

  @override
  void initState() {
    super.initState();
    accessTokenNotifier.addListener(authChangeNotifierListener);
  }

  void authChangeNotifierListener() {
    profileBloc?.add(ProfileAuthChangedInfo(accessTokenNotifier.value));
  }

  @override
  void dispose() {
    accessTokenNotifier.removeListener(authChangeNotifierListener);
    profileBloc?.close();
    stateStreamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: AppDrawer(),
      body: BlocProvider<ProfileBloc>(
        create: (context) {
          final bloc = ProfileBloc();
          bloc.add(ProfileStarted(accessTokenNotifier.value));
          stateStreamSubscription = bloc.stream.listen((state) {
            if (state is ProfileAuthRequired) {
              Navigator.of(context, rootNavigator: true)
                  .push(MaterialPageRoute(builder: (context) => AuthPage()))
                  .then((value) => setState(() {}));
            }
          });
          profileBloc = bloc;
          return bloc;
        },
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileInitial) {
              return Container(
                width: MediaQuery.of(context).size.width,
                child: Center(child: CircularProgressIndicator()),
              );
            } else if (state is ProfileSuccess) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(24),
                      height: 120,
                      color: Theme.of(context).colorScheme.primary,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // profile title
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white70),
                            child: CircleAvatar(
                              minRadius: 40,
                              maxRadius: 40,
                              backgroundImage: NetworkImage(
                                'https://wisehealthynwealthy.com/wp-content/uploads/2022/01/CreativecaptionsforFacebookprofilepictures.jpg',
                              ),
                            ),
                          ),
                          SizedBox(width: 6),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                userFullNameNotifier.value,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(color: Colors.white),
                              ),
                              // SizedBox(height: 4),
                              // Text(
                              //   'Reference No: 2048204',
                              //   style: Theme.of(context)
                              //       .textTheme
                              //       .bodySmall!
                              //       .copyWith(color: Colors.white),
                              // ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(24),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(Icons.person),
                              SizedBox(width: 10),
                              Text(
                                'Personal Information',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                          SizedBox(height: 28),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(Icons.school),
                              SizedBox(width: 10),
                              Text(
                                'University Applications',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                          SizedBox(height: 28),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(Icons.topic_outlined),
                              SizedBox(width: 10),
                              Text(
                                'Exam Applications',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                          SizedBox(height: 28),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(Icons.language),
                              SizedBox(width: 10),
                              Text(
                                'Online Exams',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                          SizedBox(height: 28),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(Icons.hotel),
                              SizedBox(width: 10),
                              Text(
                                'Services',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                          SizedBox(height: 28),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(Icons.mail),
                              SizedBox(width: 10),
                              Text(
                                'Messages',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                          SizedBox(height: 28),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(Icons.password),
                              SizedBox(width: 10),
                              Text(
                                'Change Password',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                          SizedBox(height: 28),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(Icons.favorite),
                              SizedBox(width: 10),
                              Text(
                                'Favorites',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                          SizedBox(height: 28),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.logout,
                                color: Colors.red,
                              ),
                              SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {
                                  instance<StudentAuthRepository>().logout();
                                },
                                child: Text(
                                  'Log Out',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 28),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.delete_forever,
                                color: Colors.red,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Delete Account',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(color: Colors.red),
                              ),
                            ],
                          ),
                          SizedBox(height: 28),
                        ],
                      ),
                    )
                  ],
                ),
              );
            } else if (state is ProfileAuthRequired) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Please Login to your account first',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true)
                              .push(MaterialPageRoute(
                                  builder: (context) => AuthPage()))
                              .then((value) => setState(() {}));
                        },
                        child: Text('Login'),
                      )
                    ],
                  ));
            } else {
              return Text(state.toString());
            }
          },
        ),
      ),
    );
  }
}