import 'package:applycamp/ui/portal/agent/students/student_create/bloc/student_create_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentCreatePage extends StatefulWidget {
  const StudentCreatePage({super.key});

  @override
  State<StudentCreatePage> createState() => _StudentCreatePageState();
}

class _StudentCreatePageState extends State<StudentCreatePage> {
  String? gender;
  String? maritalStatus;
  bool isVisaRequired = false;
  bool hasTCNumber = false;
  bool isTransfered = false;
  bool isTurkeyCitizen = false;

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
                      TextField(
                        decoration: InputDecoration(
                          label: Text('Full Name *'),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          label: Text('Email *'),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          label: Text('Phone *'),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          label: Text('Birth Date *'),
                        ),
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
                            title: Text('Male'),
                            value: 'male',
                            groupValue: maritalStatus,
                            onChanged: (value) {
                              setState(() {
                                maritalStatus = value.toString();
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text('Female'),
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
                      TextField(
                        decoration: InputDecoration(
                          label: Text('Father Name *'),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          label: Text('Mother Name *'),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          label: Text('Father Phone'),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          label: Text('Address Abroad'),
                        ),
                      ),
                      TextField(
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
                        decoration: InputDecoration(
                          label: Text('Passport Number *'),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          label: Text('Passport Date of Issue *'),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          label: Text('Passport Date of Expiry *'),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          label: Text('Nationality *'),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          label: Text('Residence *'),
                        ),
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
                        decoration: InputDecoration(
                          label: Text('High School *'),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          label: Text('Degree *'),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          label: Text('GPA (Grade Point Average)'),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          label: Text('High School Country'),
                        ),
                      ),
                      SizedBox(height: 26),
                      Text(
                        'Documents',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Upload Photo *'),
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
