import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/img/applycamp_logo.png",
            width: 55,
          ),
          const Text(
            'Apply Camp',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
      // actions: const [
      //   Padding(
      //     padding: EdgeInsets.only(right: 6, left: 10),
      //     child: Icon(Icons.notifications_outlined),
      //   ),
      //   Padding(
      //     padding: EdgeInsets.only(right: 10, left: 6),
      //     child: Icon(Icons.shopping_bag_outlined),
      //   ),
      // ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
