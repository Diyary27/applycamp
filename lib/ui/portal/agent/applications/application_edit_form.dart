import 'package:applycamp/data/model/application_models/application.dart';
import 'package:applycamp/data/model/application_models/application_create_fields.dart';
import 'package:applycamp/ui/portal/agent/applications/bloc/applications_bloc.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApplicationEditForm extends StatelessWidget {
  ApplicationEditForm({
    super.key,
    required this.createFields,
    required this.application,
  });

  final Application application;
  final ApplicationCreateFields createFields;

  @override
  Widget build(BuildContext context) {
    // lists
    final List<DropDownValueModel> countries = [];
    for (var element in (createFields.countries)) {
      countries.add(DropDownValueModel(name: element.title, value: element.id));
    }
    final List<DropDownValueModel> schoolTypes = [];
    for (var element in (createFields.schoolTypes)) {
      schoolTypes
          .add(DropDownValueModel(name: element.title, value: element.id));
    }
    final List<DropDownValueModel> schools = [];
    for (var element in (createFields.schools)) {
      schools.add(DropDownValueModel(name: element.title, value: element.id));
    }
    final List<DropDownValueModel> studyLanguages = [];
    for (var element in (createFields.studyLanguages)) {
      studyLanguages
          .add(DropDownValueModel(name: element.title, value: element.id));
    }
    final List<DropDownValueModel> degrees = [];
    for (var element in (createFields.degrees)) {
      degrees.add(DropDownValueModel(name: element.title, value: element.id));
    }
    final List<DropDownValueModel> programs = [];
    for (var element in (createFields.programs)) {
      programs.add(DropDownValueModel(name: element.title, value: element.id));
    }
    final List<DropDownValueModel> semesters = [
      DropDownValueModel(name: '2018-2019 fall', value: "20181"),
      DropDownValueModel(name: '2018-2019 spring', value: "20182"),
      DropDownValueModel(name: '2018-2019 summer', value: "20183"),
      DropDownValueModel(name: '2019-2020 fall', value: "20191"),
    ];

    // controllers
    final SingleValueDropDownController _countryController =
        SingleValueDropDownController(
            data: countries.firstWhere((element) =>
                element.value == application.school!.city!.countryId!));
    final SingleValueDropDownController _schoolTypeController =
        SingleValueDropDownController(
            data: schoolTypes.firstWhere((element) =>
                element.value == application.school!.schoolTypeId));
    final SingleValueDropDownController _schoolController =
        SingleValueDropDownController(
            data: schools.firstWhere(
                (element) => element.value == application.school!.id));
    final SingleValueDropDownController _studyLanguageController =
        SingleValueDropDownController(
            data: countries.firstWhere((element) =>
                element.value == application.school!.city!.countryId!));
    final SingleValueDropDownController _degreeController =
        SingleValueDropDownController(
            data: degrees.firstWhere(
                (element) => element.value == application.degreeId));
    final SingleValueDropDownController _programController =
        SingleValueDropDownController(
            data: programs.firstWhere(
                (element) => element.value == application.programId));
    final SingleValueDropDownController _semesterController =
        SingleValueDropDownController(
            data: semesters.firstWhere(
                (element) => element.value == application.semesterId));
    final TextEditingController _applicationIdController =
        TextEditingController();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Text(
              "Edit Application of ${application.student!.fullName!} for ${application.schoolProgram!.program.title}",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 18),
            DropDownTextField(
              textFieldDecoration:
                  const InputDecoration(label: Text("Country")),
              controller: _countryController,
              dropDownList: countries,
            ),
            const SizedBox(height: 18),
            DropDownTextField(
              textFieldDecoration:
                  const InputDecoration(label: Text("School Type")),
              controller: _schoolTypeController,
              dropDownList: schoolTypes,
            ),
            const SizedBox(height: 18),
            DropDownTextField(
              textFieldDecoration: const InputDecoration(label: Text("School")),
              controller: _schoolController,
              dropDownList: schools,
            ),
            const SizedBox(height: 18),
            DropDownTextField(
              textFieldDecoration:
                  const InputDecoration(label: Text("Study Language")),
              controller: _studyLanguageController,
              dropDownList: studyLanguages,
            ),
            const SizedBox(height: 18),
            DropDownTextField(
              textFieldDecoration: const InputDecoration(label: Text("Degree")),
              controller: _degreeController,
              dropDownList: degrees,
            ),
            const SizedBox(height: 18),
            DropDownTextField(
              textFieldDecoration:
                  const InputDecoration(label: Text("Program")),
              controller: _programController,
              dropDownList: programs,
            ),
            const SizedBox(height: 18),
            DropDownTextField(
              textFieldDecoration:
                  const InputDecoration(label: Text("Semester")),
              controller: _semesterController,
              dropDownList: semesters,
            ),
            const SizedBox(height: 18),
            TextField(
                controller: _applicationIdController,
                decoration:
                    const InputDecoration(label: Text("Application ID"))),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<ApplicationsBloc>().add(ApplicationsStarted());
                  },
                  child: const Text("Back"),
                ),
                // SizedBox(w),
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<ApplicationsBloc>()
                        .add(ApplicationEditBtnClicked(
                          applicationId: application.id,
                          studentId: application.studentId!,
                          schoolId: _schoolController.dropDownValue?.value,
                          programId: _programController.dropDownValue?.value,
                          degreeId: _degreeController.dropDownValue?.value,
                          externalId: _applicationIdController.text,
                          semesterId: _semesterController.dropDownValue?.value,
                        ));
                  },
                  child: const Text("Save Changes"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
