import 'package:applycamp/ui/app_bar.dart';
import 'package:applycamp/ui/drawer.dart';
import 'package:applycamp/ui/support/contact_us.dart';
import 'package:flutter/material.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ContactUsPage()));
              },
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.contact_phone,
                      size: 60,
                    ),
                    SizedBox(height: 10),
                    Text('Contact Us'),
                  ],
                ),
              ),
            ),
            Divider(),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.support_agent,
                    size: 60,
                  ),
                  SizedBox(height: 10),
                  Text('Messages')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
