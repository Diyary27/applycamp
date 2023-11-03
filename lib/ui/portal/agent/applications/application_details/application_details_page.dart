import 'package:applycamp/core/common/extensions.dart';
import 'package:applycamp/data/model/application_models/application.dart';
import 'package:applycamp/di/service_locator.dart';
import 'package:applycamp/domain/repository/application_repository.dart';
import 'package:applycamp/ui/portal/agent/applications/application_details/bloc/application_details_bloc.dart';
import 'package:applycamp/ui/portal/agent/applications/bloc/applications_bloc.dart';
import 'package:applycamp/ui/portal/agent/students/student_details/student_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApplicationDetailsPage extends StatelessWidget {
  ApplicationDetailsPage({
    super.key,
    required this.applicationId,
  });

  final int applicationId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ApplicationDetailsBloc()
        ..add(ApplicationDetailsStarted(applicationId)),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Application Details'),
        ),
        body: BlocBuilder<ApplicationDetailsBloc, ApplicationDetailsState>(
          builder: (context, state) {
            if (state is ApplicationDetailsInitial) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ApplicationDetailsSuccess) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  // main column
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                            SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Name: ",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(state.application.student!.fullName!),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Email: ",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(state.application.student!.email!),
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
                                Text(state.application.student!.phone != null
                                    ? state.application.student!.phone
                                        .toString()
                                    : ''),
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
                                Text(state.application.student!.nationality
                                            ?.name !=
                                        null
                                    ? state
                                        .application.student!.nationality!.name
                                    : ''),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Passport No.: ",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(state.application.student!.passportNumber
                                    .toString()),
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
                                Text(state.application.student!.fatherName!),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => StudentDetailsPage(
                                          studentId:
                                              state.application.student!.id,
                                        )));
                              },
                              child: Text('View Student'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
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
                                Text(state.application.status!.progress
                                        .toString() +
                                    "%"),
                                SizedBox(width: 10),
                                Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: HexColor.fromHex(
                                        state.application.status!.bgColor!),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    state.application.status!.title!,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "University: ",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(state.application.school!.title),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Maker: ",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(state.application.maker!.name),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Assigned To: ",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(state.application.assignedTo.isNotEmpty
                                    ? state.application.assignedTo.toString()
                                    : ''),
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
                                Text(state.application.degree!.title),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Semester: ",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(state.application.semester!.title),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Program: ",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(
                                  state
                                      .application.schoolProgram!.program.title,
                                  overflow: TextOverflow.clip,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Application ID: ",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(state.application.externalId != null
                                    ? state.application.externalId.toString()
                                    : ''),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Note: ",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(state.application.note != null
                                    ? state.application.note.toString()
                                    : ''),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 18),
                      state.application.isProceedToNextStepActive!
                          ? ElevatedButton(
                              onPressed: () {
                                instance<ApplicationRepository>()
                                    .proceedToNextStep(state.application.id!);
                              },
                              child: Text('Proceed To Next Step'),
                            )
                          : Text(
                              "Proceeded to next step",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: Colors.green,
                                  ),
                            ),

                      //  اینجا باید فایل اسناد و همچنین log رو نمایش بدم
                    ],
                  ),
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
