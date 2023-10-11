import 'package:applycamp/ui/portal/agent/darwer.dart';
import 'package:flutter/material.dart';

class ApplicationsPage extends StatelessWidget {
  const ApplicationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Applications'),
      ),
      drawer: AgentDrawer(),
      body: Column(
        children: [],
      ),
    );
  }
}
