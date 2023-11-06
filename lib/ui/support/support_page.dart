import 'package:applycamp/ui/components/app_bar.dart';
import 'package:applycamp/ui/components/drawer.dart';
import 'package:applycamp/ui/support/contact_us.dart';
import 'package:flutter/material.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const ContactUsPage()));
              },
              child: Container(
                child: const Column(
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
            const Divider(),
            Container(
              child: const Column(
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
