import 'package:applycamp/data/model/application_models/academic_year.dart';
import 'package:applycamp/data/model/application_models/application_abilities.dart';
import 'package:applycamp/data/model/application_models/application_document.dart';
import 'package:applycamp/data/model/application_models/application_status.dart';
import 'package:applycamp/data/model/application_models/available_next_statues.dart';
import 'package:applycamp/data/model/application_models/confirm_to_download.dart';
import 'package:applycamp/data/model/application_models/semester.dart';
import 'package:applycamp/data/model/program_search_models/degrees.dart';
import 'package:applycamp/data/model/program_search_models/school.dart';
import 'package:applycamp/data/model/program_search_models/school_programs.dart';
import 'package:applycamp/data/model/student_model/maker.dart';
import 'package:applycamp/data/model/student_model/student_model.dart';

class Application {
  Application({
    required this.id,
    required this.studentId,
    required this.schoolId,
    required this.programId,
    required this.degreeId,
    required this.statusId,
    required this.assignedToId,
    required this.note,
    required this.externalId,
    required this.academicYearSlug,
    required this.semesterId,
    required this.documents,
    required this.confirmToDownload,
    required this.isProceedToNextStepActive,
    required this.can,
    required this.completedAt,
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
    required this.messages,
  });

  final int id;
  final int? studentId;
  final int? schoolId;
  final int? programId;
  final int? degreeId;
  final int? statusId;
  final dynamic assignedToId;
  final dynamic note;
  final dynamic externalId;
  final String? academicYearSlug;
  final String? semesterId;
  final List<dynamic> documents;
  final dynamic confirmToDownload;
  final bool? isProceedToNextStepActive;
  final ApplicationCan? can;
  final dynamic completedAt;
  final String? createdAt;
  final String? updatedAt;
  final DateTime? createdAtAbsolute;
  final Student? student;
  final School? school;
  final Degree? degree;
  final AvailableNextStatuses? status;
  final SchoolProgram? schoolProgram;
  final List<dynamic> assignedTo;
  final Maker? maker;
  final Semester? semester;
  final AcademicYear? academicYear;
  final List<dynamic> messages;

  factory Application.fromJson(Map<String, dynamic> json) {
    return Application(
      id: json["id"],
      studentId: json["studentId"],
      schoolId: json["schoolId"],
      programId: json["programId"],
      degreeId: json["degreeId"],
      statusId: json["statusId"],
      assignedToId: json["assignedToId"],
      note: json["note"],
      externalId: json["externalId"],
      academicYearSlug: json["academicYearSlug"],
      semesterId: json["semesterId"],
      documents: json["documents"] == null
          ? []
          : List<ApplicationDocument>.from(
              json["documents"]!.map((x) => ApplicationDocument.fromJson(x))),
      confirmToDownload: json["confirmToDownload"],
      isProceedToNextStepActive: json["isProceedToNextStepActive"],
      can: json["can"] == null ? null : ApplicationCan.fromJson(json["can"]),
      completedAt: json["completedAt"],
      createdAt: json["createdAt"],
      updatedAt: json["updatedAt"],
      createdAtAbsolute: DateTime.tryParse(json["createdAtAbsolute"] ?? ""),
      student:
          json["student"] == null ? null : Student.fromJson(json["student"]),
      school: json["school"] == null ? null : School.fromJson(json["school"]),
      degree: json["degree"] == null ? null : Degree.fromJson(json["degree"]),
      status: json["status"] == null
          ? null
          : AvailableNextStatuses.fromJson(json["status"]),
      schoolProgram: json["schoolProgram"] == null
          ? null
          : SchoolProgram.fromJson(json["schoolProgram"]),
      assignedTo: json["assignedTo"] == null
          ? []
          : List<dynamic>.from(json["assignedTo"]!.map((x) => x)),
      maker: json["maker"] == null ? null : Maker.fromJson(json["maker"]),
      semester:
          json["semester"] == null ? null : Semester.fromJson(json["semester"]),
      academicYear: json["academicYear"] == null
          ? null
          : AcademicYear.fromJson(json["academicYear"]),
      messages: json["messages"] == null
          ? []
          : List<dynamic>.from(json["messages"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "studentId": studentId,
        "schoolId": schoolId,
        "programId": programId,
        "degreeId": degreeId,
        "statusId": statusId,
        "assignedToId": assignedToId,
        "note": note,
        "externalId": externalId,
        "academicYearSlug": academicYearSlug,
        "semesterId": semesterId,
        "documents": documents.map((x) => x?.toJson()).toList(),
        "confirmToDownload": confirmToDownload,
        "isProceedToNextStepActive": isProceedToNextStepActive,
        "can": can?.toJson(),
        "completedAt": completedAt,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "createdAtAbsolute": createdAtAbsolute?.toIso8601String(),
        "student": student?.toJson(),
        "school": school?.toJson(),
        "degree": degree?.toJson(),
        "status": status?.toJson(),
        "schoolProgram": schoolProgram?.toJson(),
        "maker": maker?.toJson(),
        "semester": semester?.toJson(),
        "academicYear": academicYear?.toJson(),
      };
}
