import 'package:applycamp/core/common/extensions.dart';
import 'package:applycamp/data/model/student_model/student_model.dart';
import 'package:applycamp/ui/portal/agent/applications/application_details/application_details_page.dart';
import 'package:applycamp/ui/portal/agent/students/student_details/bloc/student_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentDetailsPage extends StatelessWidget {
  StudentDetailsPage({
    super.key,
    required this.studentId,
  });

  final int studentId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          StudentDetailsBloc()..add(StudentDetailsStarted(studentId)),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Student Details'),
        ),
        body: BlocBuilder<StudentDetailsBloc, StudentDetailsState>(
          builder: (context, state) {
            if (state is StudentDetailsInitial) {
              return Center(child: CircularProgressIndicator());
            } else if (state is StudentDetailsSuccess) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            CircleAvatar(
                              minRadius: 40,
                              maxRadius: 40,
                              backgroundImage: NetworkImage(
                                'https://wisehealthynwealthy.com/wp-content/uploads/2022/01/CreativecaptionsforFacebookprofilepictures.jpg',
                              ),
                            ),
                            SizedBox(height: 18),
                            Text(state.student.fullName!,
                                style: Theme.of(context).textTheme.titleMedium),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Email: ",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(state.student.email!),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Birth Date: ",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(state.student.dateOfBirth!),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Gender: ",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(state.student.gender!),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Marital Status: ",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(state.student.martialStatus!),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Phone: ",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(state.student.phone.toString()),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Father Name: ",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(state.student.fatherName!),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Mother Name: ",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(state.student.motherName!),
                              ],
                            ),
                            SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('Download Student Information'),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('Download PDF'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Passport No.: ",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(state.student.passportNumber.toString()),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Passport Issue: ",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(state.student.passportDateOfIssue
                                    .toString()),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Passport Expiry: ",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(state.student.passportDateOfExpiry
                                    .toString()),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Nationality: ",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(state.student.nationality!.fullName),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "High School: ",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(state.student.highSchool.toString()),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "GPA: ",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(state.student.gpa.toString()),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Degree: ",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(state.student.degree!.title.toString()),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      //
                      // Applications
                      //
                      Text(
                        "Applications",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: 250,
                        child: ListView.builder(
                          itemCount: state.student.applications.length,
                          itemBuilder: (context, index) {
                            final application =
                                state.student.applications[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) =>
                                        ApplicationDetailsPage(
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            application.student!.name!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium,
                                          ),
                                          SizedBox(height: 3),
                                          Text('Program:  \n' +
                                              application.schoolProgram!.program
                                                  .title),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              );
            } else if (state is StudentDetailsError) {
              return Center(child: Text("Error"));
            } else {
              return Text(state.toString());
            }
          },
        ),
      ),
    );
  }
}
