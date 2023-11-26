import 'dart:io';

import 'package:applycamp/data/model/application_models/document_type.dart';
import 'package:applycamp/data/model/file_element.dart';
import 'package:applycamp/data/model/student_model/student_document.dart';
import 'package:applycamp/di/service_locator.dart';
import 'package:applycamp/domain/entity/student_create_params.dart';
import 'package:applycamp/domain/repository/student_repository.dart';
import 'package:applycamp/ui/portal/agent/students/student_create/bloc/student_create_bloc.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class StudentCreatePage extends StatefulWidget {
  StudentCreatePage({super.key});

  @override
  State<StudentCreatePage> createState() => _StudentCreatePageState();
}

class _StudentCreatePageState extends State<StudentCreatePage> {
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  // yyyy-mm-dd
  DateTime? birthDate;
  String? gender;
  String? maritalStatus;
  TextEditingController _fatherNameController = TextEditingController();
  TextEditingController _motherNameController = TextEditingController();
  TextEditingController _fatherPhoneController = TextEditingController();
  TextEditingController _addressAbroadController = TextEditingController();
  TextEditingController _turekyAddressController = TextEditingController();
  TextEditingController _passPortNumberController = TextEditingController();
  DateTime? passPortDateofIssue;
  DateTime? passPortDateofExpiry;
  SingleValueDropDownController _nationalityController =
      SingleValueDropDownController();
  SingleValueDropDownController _residenceController =
      SingleValueDropDownController();
  bool isVisaRequired = false;
  bool hasTCNumber = false;
  bool isTransfered = false;
  bool isTurkeyCitizen = false;
  TextEditingController _highSchoolController = TextEditingController();
  SingleValueDropDownController _degreeController =
      SingleValueDropDownController();
  TextEditingController _gpaController = TextEditingController();
  SingleValueDropDownController _highSchoolCountryController =
      SingleValueDropDownController();

  // for documents
  late FileElement photoController;
  // late StudentDocument diplomaController;
  // late StudentDocument transcriptController;
  // late StudentDocument passportController;
  // late StudentDocument skillsController;
  // late StudentDocument recommendationLetterController;
  // late StudentDocument motivationController;
  // late StudentDocument courseDescriptionController;
  // late StudentDocument blueCardTCCitizenController;
  // late StudentDocument tcNumberController;
  // late StudentDocument otherFilesController;

  List<StudentDocument> documents = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Student'),
      ),
      body: BlocProvider(
        create: (context) => StudentCreateBloc()..add(StudentCreateStarted()),
        child: BlocBuilder<StudentCreateBloc, StudentCreateState>(
          builder: (context, state) {
            if (state is StudentCreateInitial) {
              return Center(child: CircularProgressIndicator());
            } else if (state is StudentCreateLoaded) {
              //
              // lists for dropdown text field
              List<DropDownValueModel> degrees = [];
              state.studentCreateFields.degrees.forEach((element) {
                degrees.add(
                    DropDownValueModel(name: element.title, value: element.id));
              });

              List<DropDownValueModel> nations = [];
              state.studentCreateFields.nations.forEach((element) {
                nations.add(DropDownValueModel(
                    name: element.fullName, value: element.id));
              });

              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Personal Information',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      TextField(
                        controller: _fullNameController,
                        decoration: InputDecoration(
                          label: Text('Full Name *'),
                        ),
                      ),
                      TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          label: Text('Email *'),
                        ),
                      ),
                      TextField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                          label: Text('Phone *'),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              final DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1950),
                                lastDate: DateTime.now(),
                              );
                              if (picked != null) {
                                setState(() {
                                  birthDate = picked;
                                });
                              }
                            },
                            child: Text('Birth Date *'),
                          ),
                          SizedBox(width: 50),
                          birthDate != null
                              ? Text(DateFormat.yMd()
                                  .format(birthDate!)
                                  .toString())
                              : Text('Select Your Birth Date'),
                        ],
                      ),
                      SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Gender *:",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          RadioListTile(
                            title: Text('Male'),
                            value: 'male',
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value.toString();
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text('Female'),
                            value: 'female',
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value.toString();
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Marital Status *:",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          RadioListTile(
                            title: Text('Married'),
                            value: 'married',
                            groupValue: maritalStatus,
                            onChanged: (value) {
                              setState(() {
                                maritalStatus = value.toString();
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text('Single'),
                            value: 'single',
                            groupValue: maritalStatus,
                            onChanged: (value) {
                              setState(() {
                                maritalStatus = value.toString();
                              });
                            },
                          ),
                        ],
                      ),
                      TextField(
                        controller: _fatherNameController,
                        decoration: InputDecoration(
                          label: Text('Father Name *'),
                        ),
                      ),
                      TextField(
                        controller: _motherNameController,
                        decoration: InputDecoration(
                          label: Text('Mother Name *'),
                        ),
                      ),
                      TextField(
                        controller: _fatherPhoneController,
                        decoration: InputDecoration(
                          label: Text('Father Phone'),
                        ),
                      ),
                      TextField(
                        controller: _addressAbroadController,
                        decoration: InputDecoration(
                          label: Text('Address Abroad'),
                        ),
                      ),
                      TextField(
                        controller: _turekyAddressController,
                        decoration: InputDecoration(
                          label: Text('Turkey Addrress'),
                        ),
                      ),
                      SizedBox(height: 26),
                      Text(
                        'Residence Information',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      TextField(
                        controller: _passPortNumberController,
                        decoration: InputDecoration(
                          label: Text('Passport Number *'),
                        ),
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              final DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1950),
                                lastDate: DateTime.now(),
                              );
                              if (picked != null) {
                                setState(() {
                                  passPortDateofIssue = picked;
                                });
                              }
                            },
                            child: Text('Passport Date of Issue *'),
                          ),
                          SizedBox(width: 50),
                          passPortDateofIssue != null
                              ? Text(
                                  DateFormat.yMd().format(passPortDateofIssue!))
                              : Text('Select a Date'),
                        ],
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              final DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1950),
                                lastDate: DateTime(2040),
                              );
                              if (picked != null) {
                                setState(() {
                                  passPortDateofExpiry = picked;
                                });
                              }
                            },
                            child: Text('Passport Date of Expiry *'),
                          ),
                          SizedBox(width: 50),
                          passPortDateofExpiry != null
                              ? Text(DateFormat.yMd()
                                  .format(passPortDateofExpiry!))
                              : Text('Select a Date'),
                        ],
                      ),
                      DropDownTextField(
                        controller: _nationalityController,
                        dropDownList: nations,
                        textFieldDecoration:
                            InputDecoration(label: Text('Nationality *')),
                      ),
                      DropDownTextField(
                        controller: _residenceController,
                        dropDownList: nations,
                        textFieldDecoration:
                            InputDecoration(label: Text('Residence *')),
                      ),
                      SizedBox(height: 10),
                      CheckboxListTile(
                        title: Text('Is Visa Required'),
                        value: isVisaRequired,
                        onChanged: (value) {
                          setState(() {
                            isVisaRequired = value!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: Text('Has TC Number'),
                        value: hasTCNumber,
                        onChanged: (value) {
                          setState(() {
                            hasTCNumber = value!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: Text('Is Transfered'),
                        value: isTransfered,
                        onChanged: (value) {
                          setState(() {
                            isTransfered = value!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: Text('Is Turkey Citizen'),
                        value: isTurkeyCitizen,
                        onChanged: (value) {
                          setState(() {
                            isTurkeyCitizen = value!;
                          });
                        },
                      ),
                      SizedBox(height: 26),
                      Text(
                        'Education Information',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      TextField(
                        controller: _highSchoolController,
                        decoration: InputDecoration(
                          label: Text('High School *'),
                        ),
                      ),
                      DropDownTextField(
                        controller: _degreeController,
                        dropDownList: degrees,
                        textFieldDecoration:
                            InputDecoration(label: Text('Degree *')),
                      ),
                      TextField(
                        controller: _gpaController,
                        decoration: InputDecoration(
                          label: Text('GPA (Grade Point Average)'),
                        ),
                      ),
                      DropDownTextField(
                        controller: _highSchoolCountryController,
                        dropDownList: nations,
                        textFieldDecoration:
                            InputDecoration(label: Text('High School Country')),
                      ),

                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () async {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles();
                          if (result != null) {
                            File image = File(result.files.first.path!);
                            final response = await instance<StudentRepository>()
                                .uploadStudentPhoto(image);
                            photoController = response;
                          }
                        },
                        child: Text('Upload Photo *'),
                      ),
                      //
                      //
                      // Documents
                      //
                      //
                      SizedBox(height: 16),
                      Text(
                        'Upload Documents',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(height: 16),
                      // documents list upload
                      SizedBox(
                        height: 250,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount:
                                state.studentCreateFields.documentTypes.length,
                            itemBuilder: (context, index) {
                              return ElevatedButton(
                                onPressed: () async {
                                  FilePickerResult? result =
                                      await FilePicker.platform.pickFiles();
                                  FileElement response = FileElement();
                                  if (result != null) {
                                    File document =
                                        File(result.files.first.path!);
                                    response =
                                        await instance<StudentRepository>()
                                            .uploadStudentDocument(
                                                document,
                                                state.studentCreateFields
                                                    .documentTypes[index].id!);
                                  }
                                  documents.add(StudentDocument(
                                    type: DocumentType(
                                        id: state.studentCreateFields
                                            .documentTypes[index].id!),
                                    files:
                                        response.id != null ? [response] : [],
                                  ));
                                },
                                child: Text(state.studentCreateFields
                                    .documentTypes[index].title!),
                              );
                            }),
                      ),

                      // ElevatedButton(
                      //   onPressed: () async {
                      //     FilePickerResult? result =
                      //         await FilePicker.platform.pickFiles();
                      //     if (result != null) {
                      //       File document = File(result.files.first.path!);
                      //       final FileElement response =
                      //           await instance<StudentRepository>()
                      //               .uploadStudentDocument(
                      //                   document,
                      //                   state.studentCreateFields
                      //                       .documentTypes[1].id!);
                      //       transcriptController = response;
                      //     }
                      //   },
                      //   child: Text('Upload Transcript'),
                      // ),
                      // ElevatedButton(
                      //   onPressed: () async {
                      //     FilePickerResult? result =
                      //         await FilePicker.platform.pickFiles();
                      //     if (result != null) {
                      //       File document = File(result.files.first.path!);
                      //       final FileElement response =
                      //           await instance<StudentRepository>()
                      //               .uploadStudentDocument(
                      //                   document,
                      //                   state.studentCreateFields
                      //                       .documentTypes[2].id!);
                      //       passportController = response;
                      //     }
                      //   },
                      //   child: Text('Upload Passport *'),
                      // ),
                      // ElevatedButton(
                      //   onPressed: () async {
                      //     FilePickerResult? result =
                      //         await FilePicker.platform.pickFiles();
                      //     if (result != null) {
                      //       File document = File(result.files.first.path!);
                      //       final FileElement response =
                      //           await instance<StudentRepository>()
                      //               .uploadStudentDocument(
                      //                   document,
                      //                   state.studentCreateFields
                      //                       .documentTypes[3].id!);
                      //       skillsController = response;
                      //     }
                      //   },
                      //   child: Text('Upload Skills'),
                      // ),
                      // ElevatedButton(
                      //   onPressed: () async {
                      //     FilePickerResult? result =
                      //         await FilePicker.platform.pickFiles();
                      //     if (result != null) {
                      //       File document = File(result.files.first.path!);
                      //       final FileElement response =
                      //           await instance<StudentRepository>()
                      //               .uploadStudentDocument(
                      //                   document,
                      //                   state.studentCreateFields
                      //                       .documentTypes[4].id!);
                      //       recommendationLetterController = response;
                      //     }
                      //   },
                      //   child: Text('Upload Recommendation Letter'),
                      // ),
                      // ElevatedButton(
                      //   onPressed: () async {
                      //     FilePickerResult? result =
                      //         await FilePicker.platform.pickFiles();
                      //     if (result != null) {
                      //       File document = File(result.files.first.path!);
                      //       final FileElement response =
                      //           await instance<StudentRepository>()
                      //               .uploadStudentDocument(
                      //                   document,
                      //                   state.studentCreateFields
                      //                       .documentTypes[5].id!);
                      //       motivationController = response;
                      //     }
                      //   },
                      //   child: Text('Upload Motivation Letter'),
                      // ),
                      // ElevatedButton(
                      //   onPressed: () async {
                      //     FilePickerResult? result =
                      //         await FilePicker.platform.pickFiles();
                      //     if (result != null) {
                      //       File document = File(result.files.first.path!);
                      //       final FileElement response =
                      //           await instance<StudentRepository>()
                      //               .uploadStudentDocument(
                      //                   document,
                      //                   state.studentCreateFields
                      //                       .documentTypes[6].id!);
                      //       courseDescriptionController = response;
                      //     }
                      //   },
                      //   child: Text('Upload Course Description'),
                      // ),
                      // ElevatedButton(
                      //   onPressed: () async {
                      //     FilePickerResult? result =
                      //         await FilePicker.platform.pickFiles();
                      //     if (result != null) {
                      //       File document = File(result.files.first.path!);
                      //       final FileElement response =
                      //           await instance<StudentRepository>()
                      //               .uploadStudentDocument(
                      //                   document,
                      //                   state.studentCreateFields
                      //                       .documentTypes[7].id!);
                      //       blueCardTCCitizenController = response;
                      //     }
                      //   },
                      //   child: Text('Upload Blue Card / Turkish Citizenship'),
                      // ),
                      // ElevatedButton(
                      //   onPressed: () async {
                      //     FilePickerResult? result =
                      //         await FilePicker.platform.pickFiles();
                      //     if (result != null) {
                      //       File document = File(result.files.first.path!);
                      //       final FileElement response =
                      //           await instance<StudentRepository>()
                      //               .uploadStudentDocument(
                      //                   document,
                      //                   state.studentCreateFields
                      //                       .documentTypes[8].id!);
                      //       tcNumberController = response;
                      //     }
                      //   },
                      //   child: Text('Upload TC Number'),
                      // ),
                      // ElevatedButton(
                      //   onPressed: () async {
                      //     FilePickerResult? result =
                      //         await FilePicker.platform.pickFiles();
                      //     if (result != null) {
                      //       File document = File(result.files.first.path!);
                      //       final FileElement response =
                      //           await instance<StudentRepository>()
                      //               .uploadStudentDocument(
                      //                   document,
                      //                   state.studentCreateFields
                      //                       .documentTypes[9].id!);
                      //       otherFilesController = response;
                      //     }
                      //   },
                      //   child: Text('Upload Other Files'),
                      // ),

                      SizedBox(height: 20),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            context
                                .read<StudentCreateBloc>()
                                .add(StudentCreateBtnClicked(
                                  fullName: _fullNameController.text,
                                  email: _emailController.text,
                                  phone: _phoneController.text,
                                  birthDate: birthDate!,
                                  gender: gender!,
                                  maritalStatus: maritalStatus!,
                                  fatherName: _fatherNameController.text,
                                  fatherPhone: _fatherPhoneController.text,
                                  motherName: _motherNameController.text,
                                  addressAbroad: _addressAbroadController.text,
                                  turkeyAddress: _turekyAddressController.text,
                                  passPortNumber:
                                      _passPortNumberController.text,
                                  passPortDateofIssue: passPortDateofIssue!,
                                  passPortDateofExpiry: passPortDateofExpiry!,
                                  nationalityId: _nationalityController
                                      .dropDownValue!.value,
                                  residenceId:
                                      _residenceController.dropDownValue!.value,
                                  isVisaRequired: isVisaRequired,
                                  hasTCNumber: hasTCNumber,
                                  isTransfered: isTransfered,
                                  isTurkeyCitizen: isTurkeyCitizen,
                                  highSchool: _highSchoolController.text,
                                  degreeId:
                                      _degreeController.dropDownValue!.value,
                                  gpa: double.tryParse(_gpaController.text),
                                  highSchoolCountryId:
                                      _highSchoolCountryController
                                          .dropDownValue!.value,
                                  photo: photoController,
                                  // diploma: diplomaController,
                                  // transcript: transcriptController,
                                  // passport: passportController,
                                  // skills: skillsController,
                                  // recommendationLetter:
                                  //     recommendationLetterController,
                                  // motivation: motivationController,
                                  // courseDescription:
                                  //     courseDescriptionController,
                                  // blueCardTCCitizen:
                                  //     blueCardTCCitizenController,
                                  // tcNumber: tcNumberController,
                                  // otherFiles: otherFilesController,
                                  documents: documents,
                                ));
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.green),
                            minimumSize: MaterialStatePropertyAll(
                              Size(MediaQuery.of(context).size.width - 100, 60),
                            ),
                          ),
                          child: Text('Create Student'),
                        ),
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
