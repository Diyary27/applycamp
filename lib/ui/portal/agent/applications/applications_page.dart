import 'package:applycamp/core/common/extensions.dart';
import 'package:applycamp/ui/portal/agent/applications/application_details/application_details_page.dart';
import 'package:applycamp/ui/portal/agent/applications/application_edit_form.dart';
import 'package:applycamp/ui/portal/agent/applications/bloc/applications_bloc.dart';
import 'package:applycamp/ui/portal/agent/darwer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class ApplicationsPage extends StatelessWidget {
  ApplicationsPage({super.key});

  final MultiSelectController _StudentController = MultiSelectController();
  ApplicationsBloc? applicationsBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Applications'),
      ),
      drawer: const AgentDrawer(),
      body: BlocProvider(
        create: (context) {
          final bloc = ApplicationsBloc();
          bloc.add(ApplicationsStarted());
          applicationsBloc = bloc;
          return bloc;
        },
        child: BlocBuilder<ApplicationsBloc, ApplicationsState>(
          builder: (context, state) {
            if (state is ApplicationsInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ApplicationsLoaded) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
                child: Column(
                  children: [
                    Text(
                      'Filter By Status',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.status.length,
                        itemBuilder: (BuildContext context, int index) {
                          final status = state.status[index];

                          return TextButton(
                            onPressed: () {
                              context.read<ApplicationsBloc>().add(
                                  ApplicationsFilterClicked(
                                      statusId: status.id));
                            },
                            child: Text(state.status[index].title),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          // filter by student
                          DropdownButton(
                              hint: const Text('Filter By Student'),
                              items: state.students.map((student) {
                                return DropdownMenuItem(
                                    value: student.id,
                                    child: Text(student.fullName!));
                              }).toList(),
                              onChanged: (newValue) {
                                context.read<ApplicationsBloc>().add(
                                    ApplicationsFilterClicked(
                                        studentId: newValue));
                              }),
                          const SizedBox(width: 10),
                          // filter by school
                          DropdownButton(
                              hint: const Text('Filter By School'),
                              items: state.schools.map((school) {
                                return DropdownMenuItem(
                                    value: school.id,
                                    child: Text(school.title));
                              }).toList(),
                              onChanged: (newValue) {
                                context.read<ApplicationsBloc>().add(
                                    ApplicationsFilterClicked(
                                        schoolId: newValue));
                              }),
                          const SizedBox(width: 10),
                          // filter by student
                          DropdownButton(
                              hint: const Text('Filter By Program'),
                              items: state.programs.map((program) {
                                return DropdownMenuItem(
                                    value: program.id,
                                    child: Text(program.program.title));
                              }).toList(),
                              onChanged: (newValue) {
                                context.read<ApplicationsBloc>().add(
                                    ApplicationsFilterClicked(
                                        programId: newValue));
                              }),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.applications.length,
                        itemBuilder: (context, index) {
                          final application = state.applications[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: ((context) => ApplicationDetailsPage(
                                        applicationId: application.id,
                                      ))));
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
                                  Column(
                                    children: [
                                      const CircleAvatar(
                                        minRadius: 40,
                                        maxRadius: 40,
                                        backgroundImage: NetworkImage(
                                          'https://wisehealthynwealthy.com/wp-content/uploads/2022/01/CreativecaptionsforFacebookprofilepictures.jpg',
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      Container(
                                        width: 100,
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          color: HexColor.fromHex(
                                              application.status!.bgColor!),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Text(
                                          application.status!.title!,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 10),
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
                                        const SizedBox(height: 3),
                                        Text('Program:  \n${application
                                                .schoolProgram!.program.title}'),
                                        (application.assignedTo.isNotEmpty)
                                            ? Text('Assignee: ${application.assignedTo}')
                                            : const Text('Assignee: '),
                                        Text('School: \n${application.school!.title}'),
                                        Text('Maker: \n${application.maker!.name}'),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () async {
                                          context
                                              .read<ApplicationsBloc>()
                                              .add(ApplicationEditStarted(
                                                applicationtId: application.id,
                                                studentId:
                                                    application.studentId!,
                                              ));
                                        },
                                        child: const Icon(Icons.edit),
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
            } else if (state is ApplicationEditLoaded) {
              return ApplicationEditForm(
                createFields: state.createFields,
                application: state.application,
              );
            } else {
              return Text(state.toString());
            }
          },
        ),
      ),
    );
  }
}
