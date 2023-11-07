import 'dart:io';

import 'package:applycamp/di/service_locator.dart';
import 'package:applycamp/domain/repository/student_repository.dart';
import 'package:applycamp/ui/portal/agent/students/student_create/bloc/student_create_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentCreatePage extends StatefulWidget {
  const StudentCreatePage({super.key});

  @override
  State<StudentCreatePage> createState() => _StudentCreatePageState();
}

class _StudentCreatePageState extends State<StudentCreatePage> {
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  // TextEditingController _birtDateController = TextEditingController();
  String? gender;
  String? maritalStatus;
  TextEditingController _fatherNameController = TextEditingController();
  TextEditingController _motherNameController = TextEditingController();
  TextEditingController _fatherPhoneController = TextEditingController();
  TextEditingController _addressAbroadController = TextEditingController();
  TextEditingController _turekyAddressController = TextEditingController();
  TextEditingController _passPortNumberController = TextEditingController();
  TextEditingController _passPortDateofIssueController =
      TextEditingController();
  TextEditingController _passPortDateofExpiryController =
      TextEditingController();
  TextEditingController _nationalityController = TextEditingController();
  TextEditingController _residenceController = TextEditingController();
  bool isVisaRequired = false;
  bool hasTCNumber = false;
  bool isTransfered = false;
  bool isTurkeyCitizen = false;
  TextEditingController _highSchoolController = TextEditingController();
  TextEditingController _degreeController = TextEditingController();
  TextEditingController _gpaController = TextEditingController();
  TextEditingController _highSchoolCountryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Student'),
      ),
      body: BlocProvider(
        create: (context) => StudentCreateBloc()..add(StudentCreateStarted()),
        child: BlocBuilder<StudentCreateBloc, StudentCreateState>(
          builder: (context, state) {
            if (state is StudentCreateInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is StudentCreateLoaded) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Personal Information',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          label: Text('Full Name *'),
                        ),
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          label: Text('Email *'),
                        ),
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          label: Text('Phone *'),
                        ),
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          label: Text('Birth Date *'),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Gender *:",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          RadioListTile(
                            title: const Text('Male'),
                            value: 'male',
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value.toString();
                              });
                            },
                          ),
                          RadioListTile(
                            title: const Text('Female'),
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
                      const SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Marital Status *:",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          RadioListTile(
                            title: const Text('Male'),
                            value: 'male',
                            groupValue: maritalStatus,
                            onChanged: (value) {
                              setState(() {
                                maritalStatus = value.toString();
                              });
                            },
                          ),
                          RadioListTile(
                            title: const Text('Female'),
                            value: 'female',
                            groupValue: maritalStatus,
                            onChanged: (value) {
                              setState(() {
                                maritalStatus = value.toString();
                              });
                            },
                          ),
                        ],
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          label: Text('Father Name *'),
                        ),
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          label: Text('Mother Name *'),
                        ),
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          label: Text('Father Phone'),
                        ),
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          label: Text('Address Abroad'),
                        ),
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          label: Text('Turkey Addrress'),
                        ),
                      ),
                      const SizedBox(height: 26),
                      Text(
                        'Residence Information',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          label: Text('Passport Number *'),
                        ),
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          label: Text('Passport Date of Issue *'),
                        ),
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          label: Text('Passport Date of Expiry *'),
                        ),
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          label: Text('Nationality *'),
                        ),
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          label: Text('Residence *'),
                        ),
                      ),
                      const SizedBox(height: 10),
                      CheckboxListTile(
                        title: const Text('Is Visa Required'),
                        value: isVisaRequired,
                        onChanged: (value) {
                          setState(() {
                            isVisaRequired = value!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: const Text('Has TC Number'),
                        value: hasTCNumber,
                        onChanged: (value) {
                          setState(() {
                            hasTCNumber = value!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: const Text('Is Transfered'),
                        value: isTransfered,
                        onChanged: (value) {
                          setState(() {
                            isTransfered = value!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: const Text('Is Turkey Citizen'),
                        value: isTurkeyCitizen,
                        onChanged: (value) {
                          setState(() {
                            isTurkeyCitizen = value!;
                          });
                        },
                      ),
                      const SizedBox(height: 26),
                      Text(
                        'Education Information',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          label: Text('High School *'),
                        ),
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          label: Text('Degree *'),
                        ),
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          label: Text('GPA (Grade Point Average)'),
                        ),
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          label: Text('High School Country'),
                        ),
                      ),
                      const SizedBox(height: 26),
                      Text(
                        'Documents',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          FilePickerResult? result = await FilePicker.platform
                              .pickFiles(allowedExtensions: ['jpg, jpeg, png']);
                          if (result != null) {
                            File image = File(result.files.first.path!);
                            instance<StudentRepository>()
                                .uploadStudentPhoto(image);
                          }
                        },
                        child: const Text('Upload Photo *'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles();
                          if (result != null) {
                            File document = File(result.files.first.path!);
                            instance<StudentRepository>().uploadStudentDocument(
                                document,
                                state.studentCreateFields.documentTypes[0].id);
                          }
                        },
                        child: const Text('Upload Diploma'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles();
                          if (result != null) {
                            File document = File(result.files.first.path!);
                            instance<StudentRepository>().uploadStudentDocument(
                                document,
                                state.studentCreateFields.documentTypes[1].id);
                          }
                        },
                        child: const Text('Upload Transcript'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles();
                          if (result != null) {
                            File document = File(result.files.first.path!);
                            instance<StudentRepository>().uploadStudentDocument(
                                document,
                                state.studentCreateFields.documentTypes[2].id);
                          }
                        },
                        child: const Text('Upload Passport *'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles();
                          if (result != null) {
                            File document = File(result.files.first.path!);
                            instance<StudentRepository>().uploadStudentDocument(
                                document,
                                state.studentCreateFields.documentTypes[3].id);
                          }
                        },
                        child: const Text('Upload Skills'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles();
                          if (result != null) {
                            File document = File(result.files.first.path!);
                            instance<StudentRepository>().uploadStudentDocument(
                                document,
                                state.studentCreateFields.documentTypes[4].id);
                          }
                        },
                        child: const Text('Upload Recommendation Letter'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles();
                          if (result != null) {
                            File document = File(result.files.first.path!);
                            instance<StudentRepository>().uploadStudentDocument(
                                document,
                                state.studentCreateFields.documentTypes[5].id);
                          }
                        },
                        child: const Text('Upload Motivation Letter'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles();
                          if (result != null) {
                            File document = File(result.files.first.path!);
                            instance<StudentRepository>().uploadStudentDocument(
                                document,
                                state.studentCreateFields.documentTypes[6].id);
                          }
                        },
                        child: const Text('Upload Course Description'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles();
                          if (result != null) {
                            File document = File(result.files.first.path!);
                            instance<StudentRepository>().uploadStudentDocument(
                                document,
                                state.studentCreateFields.documentTypes[7].id);
                          }
                        },
                        child: const Text(
                            'Upload Blue Card / Turkish Citizenship'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles();
                          if (result != null) {
                            File document = File(result.files.first.path!);
                            instance<StudentRepository>().uploadStudentDocument(
                                document,
                                state.studentCreateFields.documentTypes[8].id);
                          }
                        },
                        child: const Text('Upload TC Number'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles();
                          if (result != null) {
                            File document = File(result.files.first.path!);
                            instance<StudentRepository>().uploadStudentDocument(
                                document,
                                state.studentCreateFields.documentTypes[9].id);
                          }
                        },
                        child: const Text('Upload Other Files'),
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.green),
                            minimumSize: MaterialStatePropertyAll(Size(
                                MediaQuery.of(context).size.width - 100, 60)),
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
