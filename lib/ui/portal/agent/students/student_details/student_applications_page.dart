import 'package:applycamp/core/common/extensions.dart';
import 'package:applycamp/ui/portal/agent/applications/application_details/application_details_page.dart';
import 'package:applycamp/ui/portal/agent/students/student_details/bloc/student_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentApplicationsPage extends StatelessWidget {
  const StudentApplicationsPage({super.key, required this.StudentId});

  final int StudentId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Applications'),
      ),
      body: BlocProvider(
        create: (context) =>
            StudentDetailsBloc()..add(StudentApplicationsStarted(StudentId)),
        child: BlocBuilder<StudentDetailsBloc, StudentDetailsState>(
          builder: (context, state) {
            if (state is StudentDetailsInitial) {
              return Center(child: CircularProgressIndicator());
            } else if (state is StudentApplicationsSuccess) {
              return ListView.builder(
                itemCount: state.student.applications.length,
                itemBuilder: (context, index) {
                  final application = state.student.applications[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => ApplicationDetailsPage(
                                applicationId: application.id,
                              ))));
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: HexColor.fromHex(
                                  application.status!.bgColor!),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              application.status!.title!,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  application.student!.name!,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                SizedBox(height: 3),
                                Text('Program:  \n' +
                                    application.schoolProgram!.program.title),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
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
