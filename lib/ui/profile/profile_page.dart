import 'package:applycamp/ui/app_bar.dart';
import 'package:applycamp/ui/drawer.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: AppDrawer(),
      body: Column(
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
                ),
                SizedBox(width: 6),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Diyar Naozary',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.white),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Reference No: 2048204',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.white),
                    ),
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
                    Text(
                      'Log Out',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.red),
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
  }
}
