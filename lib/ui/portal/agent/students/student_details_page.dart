import 'package:applycamp/data/model/student_model/student_model.dart';
import 'package:flutter/material.dart';

class StudentDetailsPage extends StatelessWidget {
  StudentDetailsPage({super.key, required this.student});

  final Student student;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
