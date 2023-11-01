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

  final SingleValueDropDownController _countryController =
      SingleValueDropDownController();
  final SingleValueDropDownController _schoolTypeController =
      SingleValueDropDownController();
  final SingleValueDropDownController _schoolController =
      SingleValueDropDownController();
  final SingleValueDropDownController _studyLanguageController =
      SingleValueDropDownController();
  final SingleValueDropDownController _degreeController =
      SingleValueDropDownController();
  final SingleValueDropDownController _programController =
      SingleValueDropDownController();
  final SingleValueDropDownController _semesterController =
      SingleValueDropDownController();
  final TextEditingController _applicationIdController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    // lists
    final List<DropDownValueModel> countries = [];
    (createFields.countries).forEach((element) {
      countries.add(DropDownValueModel(name: element.title, value: element.id));
    });
    final List<DropDownValueModel> schoolTypes = [];
    (createFields.schoolTypes).forEach((element) {
      schoolTypes
          .add(DropDownValueModel(name: element.title, value: element.id));
    });
    final List<DropDownValueModel> schools = [];
    (createFields.schools).forEach((element) {
      schools.add(DropDownValueModel(name: element.title, value: element.id));
    });
    final List<DropDownValueModel> studyLanguages = [];
    (createFields.studyLanguages).forEach((element) {
      studyLanguages
          .add(DropDownValueModel(name: element.title, value: element.id));
    });
    final List<DropDownValueModel> degrees = [];
    (createFields.degrees).forEach((element) {
      degrees.add(DropDownValueModel(name: element.title, value: element.id));
    });
    final List<DropDownValueModel> programs = [];
    (createFields.programs).forEach((element) {
      programs.add(DropDownValueModel(name: element.title, value: element.id));
    });
    final List<DropDownValueModel> semesters = [];
    (createFields.academicYears).forEach((element) {
      semesters
          .add(DropDownValueModel(name: element.slug, value: element.slug));
    });

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Text(
              "Edit Application of " +
                  application.student!.fullName +
                  " for " +
                  application.schoolProgram!.program.title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 18),
            DropDownTextField(
              textFieldDecoration: InputDecoration(label: Text("Country")),
              controller: _countryController,
              dropDownList: countries,
            ),
            SizedBox(height: 18),
            DropDownTextField(
              textFieldDecoration: InputDecoration(label: Text("School Type")),
              controller: _schoolTypeController,
              dropDownList: schoolTypes,
            ),
            SizedBox(height: 18),
            DropDownTextField(
              textFieldDecoration: InputDecoration(label: Text("School")),
              controller: _schoolController,
              dropDownList: schools,
            ),
            SizedBox(height: 18),
            DropDownTextField(
              textFieldDecoration:
                  InputDecoration(label: Text("Study Language")),
              controller: _studyLanguageController,
              dropDownList: studyLanguages,
            ),
            SizedBox(height: 18),
            DropDownTextField(
              textFieldDecoration: InputDecoration(label: Text("Degree")),
              controller: _degreeController,
              dropDownList: degrees,
            ),
            SizedBox(height: 18),
            DropDownTextField(
              textFieldDecoration: InputDecoration(label: Text("Program")),
              controller: _programController,
              dropDownList: programs,
            ),
            SizedBox(height: 18),
            DropDownTextField(
              textFieldDecoration: InputDecoration(label: Text("Semester")),
              controller: _semesterController,
              dropDownList: semesters,
            ),
            SizedBox(height: 18),
            TextField(
                controller: _applicationIdController,
                decoration: InputDecoration(label: Text("Application ID"))),
            SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<ApplicationsBloc>().add(ApplicationsStarted());
                  },
                  child: Text("Back"),
                ),
                // SizedBox(w),
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<ApplicationsBloc>()
                        .add(ApplicationEditBtnClicked(
                          studentId: application.studentId!,
                          schoolId: _schoolController.dropDownValue?.value,
                          programId: _programController.dropDownValue?.value,
                          degreeId: _degreeController.dropDownValue?.value,
                          externalId: _applicationIdController.text,
                          semesterId: _semesterController.dropDownValue?.value,
                        ));
                  },
                  child: Text("Save Changes"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
