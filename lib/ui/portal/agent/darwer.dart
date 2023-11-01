import 'package:applycamp/ui/portal/agent/applications/applications_page.dart';
import 'package:applycamp/ui/portal/agent/dashboard.dart';
import 'package:applycamp/ui/portal/agent/profile/profile.dart';
import 'package:applycamp/ui/portal/agent/students/students_page.dart';
import 'package:applycamp/ui/portal/agent/sub_users/sub_users_page.dart';
import 'package:applycamp/ui/root.dart';
import 'package:applycamp/ui/search/search_page.dart';
import 'package:applycamp/ui/universities/universities_list_page.dart';
import 'package:flutter/material.dart';

class AgentDrawer extends StatelessWidget {
  const AgentDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.5,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => AgentDashboardPage()));
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(Icons.workspaces),
                    SizedBox(width: 5),
                    Text(
                      'Dashboard',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => PortalProfilePage()));
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(Icons.person),
                    SizedBox(width: 5),
                    Text(
                      'Profile',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => SubUsersPage()));
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(Icons.people),
                    SizedBox(width: 5),
                    Text(
                      'Sub Users',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => UniversitiesListPage()));
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(Icons.school),
                    SizedBox(width: 5),
                    Text(
                      'Schools',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => StudentsPage()));
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(Icons.school),
                    SizedBox(width: 5),
                    Text(
                      'Students',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => ApplicationsPage()));
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(Icons.app_registration),
                    SizedBox(width: 5),
                    Text(
                      'Applications',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).push(
                      MaterialPageRoute(builder: (context) => SearchPage()));
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 5),
                    Text(
                      'Program Search',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),

              //
              TextButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pushReplacement(
                      MaterialPageRoute(builder: (context) => RootScreen()));
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(Icons.logout, color: Colors.red),
                    SizedBox(width: 5),
                    Text(
                      'Exit Portal',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.red),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
