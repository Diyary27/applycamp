import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});
  final privacyText = '''''';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Privacy Policy")),
        body: Container(
            child: Column(
          children: [
            Text(privacyText),
          ],
        )));
  }
}
