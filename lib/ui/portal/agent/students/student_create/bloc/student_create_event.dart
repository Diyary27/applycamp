part of 'student_create_bloc.dart';

abstract class StudentCreateEvent {}

class StudentCreateStarted extends StudentCreateEvent {}

class StudentCreateBtnClicked extends StudentCreateEvent {
  final String fullName;
  final String email;
  final String phone;
  final DateTime birthDate;
  final String gender;
  final String maritalStatus;
  final String fatherName;
  String? fatherPhone;
  final String motherName;
  String? addressAbroad;
  String? turkeyAddress;
  final String passPortNumber;
  final DateTime passPortDateofIssue;
  final DateTime passPortDateofExpiry;
  final int nationalityId;
  final int residenceId;
  final bool isVisaRequired;
  final bool hasTCNumber;
  final bool isTransfered;
  final bool isTurkeyCitizen;
  final String highSchool;
  final int degreeId;
  double? gpa;
  int? highSchoolCountryId;

  final FileElement photo;
  // FileElement? diploma;
  // FileElement? transcript;
  // final FileElement passport;
  // FileElement? skills;
  // FileElement? recommendationLetter;
  // FileElement? motivation;
  // FileElement? courseDescription;
  // FileElement? blueCardTCCitizen;
  // FileElement? tcNumber;
  // FileElement? otherFiles;
  final List<StudentDocument> documents;

  StudentCreateBtnClicked({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.birthDate,
    required this.gender,
    required this.maritalStatus,
    required this.fatherName,
    this.fatherPhone,
    required this.motherName,
    this.addressAbroad,
    this.turkeyAddress,
    required this.passPortNumber,
    required this.passPortDateofIssue,
    required this.passPortDateofExpiry,
    required this.nationalityId,
    required this.residenceId,
    required this.isVisaRequired,
    required this.hasTCNumber,
    required this.isTransfered,
    required this.isTurkeyCitizen,
    required this.highSchool,
    required this.degreeId,
    this.gpa,
    this.highSchoolCountryId,
    required this.photo,
    // this.diploma,
    // this.transcript,
    // required this.passport,
    // this.skills,
    // this.recommendationLetter,
    // this.motivation,
    // this.courseDescription,
    // this.blueCardTCCitizen,
    // this.tcNumber,
    // this.otherFiles,
    required this.documents,
  });
}
