import 'package:applycamp/ui/profile/profile_page.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(24, 50, 24, 24),
            height: 200,
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
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProfilePage()));
                      },
                      child: Text(
                        'View Profile',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ExpansionTile(
            title: Text('Apply Camp'),
            children: [
              Text(
                'About Us',
              )
            ],
          ),
        ],
      ),
    );
  }
}
