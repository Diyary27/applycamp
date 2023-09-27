import 'package:applycamp/di/service_locator.dart';
import 'package:applycamp/domain/repository/student_auth_repository.dart';
import 'package:applycamp/ui/auth/auth_page.dart';
import 'package:applycamp/ui/portal/agent/dashboard.dart';
import 'package:applycamp/ui/profile/profile_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppDrawer extends StatefulWidget {
  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:
          // profile container
          ValueListenableBuilder(
              valueListenable: accessTokenNotifier,
              builder: (context, value, child) {
                return Column(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(24, 50, 24, 24),
                            height: 200,
                            color: Theme.of(context).colorScheme.primary,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  child: value != null
                                      ? CircleAvatar(
                                          minRadius: 40,
                                          maxRadius: 40,
                                          backgroundImage: NetworkImage(
                                            'https://wisehealthynwealthy.com/wp-content/uploads/2022/01/CreativecaptionsforFacebookprofilepictures.jpg',
                                          ),
                                        )
                                      : Container(),
                                ),
                                SizedBox(width: 6),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      value != null
                                          ? userFullNameNotifier.value
                                          : 'Guest',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(color: Colors.white),
                                    ),
                                    SizedBox(height: 4),
                                    value != null
                                        ? GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).pop();
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ProfilePage()));
                                            },
                                            child: Text(
                                              'View Profile',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                      color: Colors.white),
                                            ),
                                          )
                                        : GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).pop();
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          AuthPage()));
                                            },
                                            child: Text(
                                              'Login',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                      color: Colors.white),
                                            ),
                                          ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // Saved Accounts
                          ExpansionTile(
                            title: Text('Apply Camp'),
                            children: [],
                          ),
                          ExpansionTile(
                            title: Text('Apply Camp'),
                            children: [
                              Text(
                                'About Us',
                              )
                            ],
                          ),
                          // for entering portal
                          if (value != null)
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context, rootNavigator: true)
                                    .pushReplacement(MaterialPageRoute(
                                  builder: (context) => AgentDashboardPage(),
                                ));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.login,
                                      color: Colors.green,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "Enter Portal",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(color: Colors.green),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),

                    // social media
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Icon(Icons.facebook, size: 36),
                          ),
                          Container(
                            child: Icon(Icons.telegram, size: 36),
                          ),
                          Container(
                            child: Icon(Icons.whatshot, size: 36),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
    );
  }
}
