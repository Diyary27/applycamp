import 'package:applycamp/core/common/extensions.dart';
import 'package:applycamp/ui/portal/agent/darwer.dart';
import 'package:applycamp/ui/portal/agent/students/bloc/students_bloc.dart';
import 'package:applycamp/ui/portal/agent/students/student_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentsPage extends StatelessWidget {
  const StudentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Students'),
      ),
      drawer: AgentDrawer(),
      body: BlocProvider(
        create: (context) {
          final bloc = StudentsBloc();
          bloc.add(StudentsStarted());
          // bloc.stream.listen((state) {});
          return bloc;
        },
        child: BlocBuilder<StudentsBloc, StudentsState>(
          builder: (context, state) {
            if (state is StudentsInitial) {
              return Center(child: CircularProgressIndicator());
            } else if (state is StudentsLoaded) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('+ Add Student'),
                    ),
                    SizedBox(height: 8),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.students.length,
                        itemBuilder: (context, index) {
                          final student = state.students[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: ((context) =>
                                      StudentDetailsPage(student: student))));
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
                                  CircleAvatar(
                                    minRadius: 40,
                                    maxRadius: 40,
                                    backgroundImage: NetworkImage(
                                      'https://wisehealthynwealthy.com/wp-content/uploads/2022/01/CreativecaptionsforFacebookprofilepictures.jpg',
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          student.name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                        SizedBox(height: 3),
                                        Text('Email: ' + student.email),
                                        (student.phone != null)
                                            ? Text('Phone: ' +
                                                student.phone.toString())
                                            : Text('Phone: '),
                                        Text('Nationality: ' +
                                            student.nationality!.name),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                            color: HexColor.fromHex(
                                                student.status.bgColor),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Text(student.status.slug),
                                        ),
                                        TextButton(
                                          onPressed: () {},
                                          child: Text('Applications'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () async {},
                                        child: Icon(Icons.edit),
                                      ),
                                      SizedBox(height: 12),
                                      Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
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
