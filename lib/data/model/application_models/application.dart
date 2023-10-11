import 'package:applycamp/data/model/application_models/academic_year.dart';
import 'package:applycamp/data/model/application_models/application_abilities.dart';
import 'package:applycamp/data/model/application_models/confirm_to_download.dart';
import 'package:applycamp/data/model/application_models/semester.dart';
import 'package:applycamp/data/model/program_search_models/degrees.dart';
import 'package:applycamp/data/model/program_search_models/school.dart';
import 'package:applycamp/data/model/program_search_models/school_programs.dart';
import 'package:applycamp/data/model/student_model/maker.dart';
import 'package:applycamp/data/model/student_model/student_model.dart';
import 'package:applycamp/data/model/user_model/status.dart';

class Application {
  Application({
    required this.id,
    required this.studentId,
    required this.schoolId,
    required this.programId,
    required this.degreeId,
    required this.statusId,
    this.assignedToId,
    this.note,
    this.externalId,
    required this.academicYearSlug,
    required this.semesterId,
    required this.documents,
    required this.confirmToDownload,
    required this.isProceedToNextStepActive,
    required this.can,
    this.completedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.createdAtAbsolute,
    required this.student,
    required this.school,
    required this.degree,
    required this.status,
    required this.schoolProgram,
    required this.assignedTo,
    required this.maker,
    required this.semester,
    required this.academicYear,
  });
  late final int id;
  late final int studentId;
  late final int schoolId;
  late final int programId;
  late final int degreeId;
  late final int statusId;
  late final assignedToId;
  late final note;
  late final externalId;
  late final String academicYearSlug;
  late final String semesterId;
  late final List<dynamic> documents;
  late final ConfirmToDownload confirmToDownload;
  late final bool isProceedToNextStepActive;
  late final ApplicationCan can;
  late final completedAt;
  late final String createdAt;
  late final String updatedAt;
  late final String createdAtAbsolute;
  late final Student student;
  late final School school;
  late final Degree degree;
  late final Status status;
  late final SchoolProgram schoolProgram;
  late final List<dynamic> assignedTo;
  late final Maker maker;
  late final Semester semester;
  late final AcademicYear academicYear;

  Application.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    studentId = json['studentId'];
    schoolId = json['schoolId'];
    programId = json['programId'];
    degreeId = json['degreeId'];
    statusId = json['statusId'];
    assignedToId = null;
    note = null;
    externalId = null;
    academicYearSlug = json['academicYearSlug'];
    semesterId = json['semesterId'];
    documents = List.castFrom<dynamic, dynamic>(json['documents']);
    confirmToDownload = ConfirmToDownload.fromJson(json['confirmToDownload']);
    isProceedToNextStepActive = json['isProceedToNextStepActive'];
    can = ApplicationCan.fromJson(json['can']);
    completedAt = null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    createdAtAbsolute = json['createdAtAbsolute'];
    student = Student.fromJson(json['student']);
    school = School.fromJson(json['school']);
    degree = Degree.fromJson(json['degree']);
    status = Status.fromJson(json['status']);
    schoolProgram = SchoolProgram.fromJson(json['schoolProgram']);
    assignedTo = List.castFrom<dynamic, dynamic>(json['assignedTo']);
    maker = Maker.fromJson(json['maker']);
    semester = Semester.fromJson(json['semester']);
    academicYear = AcademicYear.fromJson(json['academicYear']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['studentId'] = studentId;
    _data['schoolId'] = schoolId;
    _data['programId'] = programId;
    _data['degreeId'] = degreeId;
    _data['statusId'] = statusId;
    _data['assignedToId'] = assignedToId;
    _data['note'] = note;
    _data['externalId'] = externalId;
    _data['academicYearSlug'] = academicYearSlug;
    _data['semesterId'] = semesterId;
    _data['documents'] = documents;
    _data['confirmToDownload'] = confirmToDownload.toJson();
    _data['isProceedToNextStepActive'] = isProceedToNextStepActive;
    _data['can'] = can.toJson();
    _data['completedAt'] = completedAt;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['createdAtAbsolute'] = createdAtAbsolute;
    _data['student'] = student.toJson();
    _data['school'] = school.toJson();
    _data['degree'] = degree.toJson();
    _data['status'] = status.toJson();
    _data['schoolProgram'] = schoolProgram.toJson();
    _data['assignedTo'] = assignedTo;
    _data['maker'] = maker.toJson();
    _data['semester'] = semester.toJson();
    _data['academicYear'] = academicYear.toJson();
    return _data;
  }
}
