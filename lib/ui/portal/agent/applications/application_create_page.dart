import 'package:applycamp/ui/portal/agent/applications/bloc/applications_bloc.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApplicationCreatePage extends StatelessWidget {
  ApplicationCreatePage({super.key, required this.studentId});

  final int studentId;

  final SingleValueDropDownController _countryController =
      SingleValueDropDownController();
  final SingleValueDropDownController _schoolTypeController =
      SingleValueDropDownController();
  final SingleValueDropDownController _schoolController =
      SingleValueDropDownController();
  final SingleValueDropDownController _languageController =
      SingleValueDropDownController();
  final SingleValueDropDownController _degreeController =
      SingleValueDropDownController();
  final SingleValueDropDownController _programController =
      SingleValueDropDownController();
  final SingleValueDropDownController _semesterController =
      SingleValueDropDownController();
  final TextEditingController _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Application'),
      ),
      body: BlocProvider(
        create: (context) {
          final bloc = ApplicationsBloc();
          bloc.add(ApplicationCreateStarted(studentId));

          bloc.stream.listen((state) {
            if (state is ApplicationCreateLoaded) {
              if (state.message != null) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.message!)));
              }
            }
          });

          return bloc;
        },
        child: BlocBuilder<ApplicationsBloc, ApplicationsState>(
          builder: (context, state) {
            if (state is ApplicationsInitial) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ApplicationCreateLoaded) {
              // lists
              final List<DropDownValueModel> countries = [];
              for (var element in (state.createFields.countries)) {
                countries.add(
                    DropDownValueModel(name: element.title, value: element.id));
              }
              final List<DropDownValueModel> schoolTypes = [];
              for (var element in (state.createFields.schoolTypes)) {
                schoolTypes.add(
                    DropDownValueModel(name: element.title, value: element.id));
              }
              final List<DropDownValueModel> schools = [];
              for (var element in (state.createFields.schools)) {
                schools.add(
                    DropDownValueModel(name: element.title, value: element.id));
              }
              final List<DropDownValueModel> studyLanguages = [];
              for (var element in (state.createFields.studyLanguages)) {
                studyLanguages.add(
                    DropDownValueModel(name: element.title, value: element.id));
              }
              final List<DropDownValueModel> degrees = [];
              for (var element in (state.createFields.degrees)) {
                degrees.add(
                    DropDownValueModel(name: element.title, value: element.id));
              }
              final List<DropDownValueModel> programs = [];
              for (var element in (state.createFields.programs)) {
                programs.add(
                    DropDownValueModel(name: element.title, value: element.id));
              }
              final List<DropDownValueModel> semesters = [
                DropDownValueModel(name: '2018-2019 fall', value: 20181),
                DropDownValueModel(name: '2018-2019 spring', value: 20182),
                DropDownValueModel(name: '2018-2019 summer', value: 20183),
                DropDownValueModel(name: '2019-2020 fall', value: 20191),
              ];

              return Padding(
                padding: const EdgeInsets.all(12),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      DropDownTextField(
                        textFieldDecoration:
                            const InputDecoration(label: Text("Country")),
                        controller: _countryController,
                        dropDownList: countries,
                      ),
                      DropDownTextField(
                        textFieldDecoration:
                            const InputDecoration(label: Text("School Type")),
                        controller: _schoolTypeController,
                        dropDownList: schoolTypes,
                      ),
                      DropDownTextField(
                        textFieldDecoration:
                            const InputDecoration(label: Text("School")),
                        controller: _schoolController,
                        dropDownList: schools,
                      ),
                      DropDownTextField(
                        textFieldDecoration: const InputDecoration(
                            label: Text("Study Language")),
                        controller: _languageController,
                        dropDownList: studyLanguages,
                      ),
                      DropDownTextField(
                        textFieldDecoration:
                            const InputDecoration(label: Text("Degree")),
                        controller: _degreeController,
                        dropDownList: degrees,
                      ),
                      DropDownTextField(
                        textFieldDecoration:
                            const InputDecoration(label: Text("Program")),
                        controller: _programController,
                        dropDownList: programs,
                      ),
                      DropDownTextField(
                        textFieldDecoration:
                            const InputDecoration(label: Text("Semester")),
                        controller: _semesterController,
                        dropDownList: semesters,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          label: Text('Note'),
                        ),
                        controller: _noteController,
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          context
                              .read<ApplicationsBloc>()
                              .add(ApplicationCreateBtnClicked(
                                studentId: studentId,
                                schoolId:
                                    _schoolController.dropDownValue!.value,
                                programId:
                                    _programController.dropDownValue!.value,
                                degreeId:
                                    _degreeController.dropDownValue!.value,
                                externalId: '',
                                semesterId:
                                    _semesterController.dropDownValue!.value,
                              ));
                        },
                        child: Text('Create Application'),
                      )
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
