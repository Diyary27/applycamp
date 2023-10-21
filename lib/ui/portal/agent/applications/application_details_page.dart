import 'package:applycamp/data/model/application_models/application.dart';
import 'package:applycamp/ui/portal/agent/students/student_details_page.dart';
import 'package:flutter/material.dart';

class ApplicationDetailsPage extends StatelessWidget {
  ApplicationDetailsPage({super.key, required this.application});

  final Application application;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Application Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                width: 500,
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
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Name: ",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(application.student.fullName),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Email: ",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(application.student.email),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Phone: ",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(application.student.phone != null
                            ? application.student.phone.toString()
                            : ''),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Nationality: ",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(application.student.nationality?.name != null
                            ? application.student.nationality!.name
                            : ''),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Passport No.: ",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(application.student.passportNumber.toString()),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Father Name: ",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(application.student.fatherName),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => StudentDetailsPage(
                                student: application.student)));
                      },
                      child: Text('View Student'),
                    ),
                  ],
                ),
              ),
              Text(application.status.title),
              Text(application.status.progress.toString() + "%"),
              Text(application.school.title),
              Text(application.maker.name),
              Text(application.assignedTo.toString()),
              Text(application.degree.title),
              Text(application.semester.title),
              Text(application.schoolProgram.program.title),
              Text(application.externalId.toString()),
              Text(application.note.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
