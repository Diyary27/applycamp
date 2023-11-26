import 'package:applycamp/core/common/extensions.dart';
import 'package:applycamp/ui/portal/agent/darwer.dart';
import 'package:applycamp/ui/portal/agent/students/bloc/students_bloc.dart';
import 'package:applycamp/ui/portal/agent/students/student_create/student_create_page.dart';
import 'package:applycamp/ui/portal/agent/students/student_details/student_applications_page.dart';
import 'package:applycamp/ui/portal/agent/students/student_details/student_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentsPage extends StatelessWidget {
  const StudentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students'),
      ),
      drawer: const AgentDrawer(),
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
              return const Center(child: CircularProgressIndicator());
            } else if (state is StudentsLoaded) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    BlocListener<StudentsBloc, StudentsState>(
                      listener: (context, state) {
                        if (state is StudentsLoaded) {
                          state.message != null
                              ? ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(state.message!)))
                              : '';
                        }
                      },
                      child: Container(),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => StudentCreatePage()));
                      },
                      child: const Text('+ Add Student'),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.students.length,
                        itemBuilder: (context, index) {
                          final student = state.students[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: ((context) => StudentDetailsPage(
                                      studentId: student.id!))));
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.only(bottom: 8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 80,
                                    height: 80,
                                    child: (student.profileImage?.path !=
                                                null &&
                                            student.profileImage?.path != '')
                                        ? CircleAvatar(
                                            minRadius: 40,
                                            maxRadius: 40,
                                            backgroundImage: NetworkImage(
                                              student.profileImage!.path,
                                            ),
                                          )
                                        : Container(),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          student.name!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                        const SizedBox(height: 3),
                                        Text('Email: ${student.email!}'),
                                        (student.phone != null)
                                            ? Text('Phone: ${student.phone}')
                                            : const Text('Phone: '),
                                        Text(
                                            'Nationality: ${student.nationality!.name}'),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                            color: HexColor.fromHex(
                                                student.status!.bgColor),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Text(student.status!.slug),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        StudentApplicationsPage(
                                                            StudentId:
                                                                student.id!)));
                                          },
                                          child: const Text('Applications'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () async {},
                                        child: const Icon(Icons.edit),
                                      ),
                                      const SizedBox(height: 12),
                                      GestureDetector(
                                        onTap: () {
                                          context.read<StudentsBloc>().add(
                                              StudentDeleteClicked(
                                                  student.id!));
                                        },
                                        child: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
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
