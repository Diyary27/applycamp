import 'package:applycamp/ui/portal/agent/students/student_create/bloc/student_create_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentCreatePage extends StatelessWidget {
  const StudentCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Student'),
      ),
      body: BlocProvider(
        create: (context) => StudentCreateBloc()..add(StudentCreateStarted()),
        child: BlocBuilder<StudentCreateBloc, StudentCreateState>(
          builder: (context, state) {
            if (state is StudentCreateInitial) {
              return Center(child: CircularProgressIndicator());
            } else if (state is StudentCreateLoaded) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Text(state.studentCreateFields.nations[0].fullName)
                  ],
                ),
              );
            } else {
              return Center(child: Text(state.toString()));
            }
          },
        ),
      ),
    );
  }
}
