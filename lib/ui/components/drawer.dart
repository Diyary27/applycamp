import 'package:applycamp/di/service_locator.dart';
import 'package:applycamp/domain/repository/agent_auth_repository.dart';
import 'package:applycamp/ui/auth/auth_page.dart';
import 'package:applycamp/ui/portal/agent/dashboard.dart';
import 'package:applycamp/ui/profile/profile_page.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

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
              valueListenable: loggedInUserNotifier,
              builder: (context, value, child) {
                return Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.fromLTRB(24, 50, 24, 24),
                              height: 200,
                              color: Theme.of(context).colorScheme.primary,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 80,
                                    height: 80,
                                    child: (value.profileImagePath != null &&
                                            value.profileImagePath != '')
                                        ? CircleAvatar(
                                            minRadius: 40,
                                            maxRadius: 40,
                                            backgroundImage: NetworkImage(
                                              value.profileImagePath!,
                                            ),
                                          )
                                        : Container(),
                                  ),
                                  const SizedBox(width: 6),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        value.key != null
                                            ? value.name!
                                            : 'Guest',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(color: Colors.white),
                                      ),
                                      const SizedBox(height: 4),
                                      value.key != null
                                          ? GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).pop();
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const ProfilePage()));
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
                                                            const AuthPage()));
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
                            // all added Agent accounts
                            ValueListenableBuilder(
                              valueListenable: AllloggedInUsersNotifier,
                              builder: (context, accounts, child) {
                                return ExpansionTile(
                                  title: const Text('Accounts'),
                                  children: [
                                    for (var account in accounts)
                                      TextButton(
                                          onPressed: () {
                                            // here wether it is agent or student repository both will do a thing
                                            instance<AgentAuthRepository>()
                                                .loadAuthInfo(account.key!);
                                          },
                                          child: Text(
                                            account.name.toString(),
                                            textAlign: TextAlign.start,
                                          )),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const AuthPage()));
                                      },
                                      child: const Text('+ Add Account'),
                                    ),
                                  ],
                                );
                              },
                            ),
                            // all added Student accounts

                            const ExpansionTile(
                              title: Text('Apply Camp'),
                              children: [
                                Text(
                                  'About Us',
                                )
                              ],
                            ),
                            // for entering portal
                            if (value.key != null)
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .pushReplacement(MaterialPageRoute(
                                    builder: (context) =>
                                        const AgentDashboardPage(),
                                  ));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.login,
                                        color: Colors.green,
                                      ),
                                      const SizedBox(width: 5),
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
                    ),

                    // social media
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: const Icon(Icons.facebook, size: 36),
                          ),
                          Container(
                            child: const Icon(Icons.telegram, size: 36),
                          ),
                          Container(
                            child: const Icon(Icons.whatshot, size: 36),
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
