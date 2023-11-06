import 'package:applycamp/ui/portal/agent/darwer.dart';
import 'package:flutter/material.dart';

class AgentDashboardPage extends StatelessWidget {
  const AgentDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      drawer: const AgentDrawer(),
      body: Container(
        child: const SingleChildScrollView(
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
