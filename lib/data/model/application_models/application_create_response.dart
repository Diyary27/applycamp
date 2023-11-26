import 'package:applycamp/data/model/application_models/application.dart';
import 'package:applycamp/data/model/application_models/upload_slots.dart';
import 'package:applycamp/data/model/program_search_models/pagination_info.dart';
import 'package:applycamp/data/model/student_model/student_model.dart';

class ApplicationCreateResponse {
  ApplicationCreateResponse({
    required this.application,
    required this.availableNextStatuses,
    required this.uploadSlots,
    required this.fileDownloadToNextStatus,
    required this.paginationInfo,
    required this.applications,
    required this.student,
    required this.message,
  });

  final Application? application;
  final List<dynamic> availableNextStatuses;
  final UploadSlots? uploadSlots;
  final dynamic fileDownloadToNextStatus;
  final PaginationInfo? paginationInfo;
  final List<Application> applications;
  final Student? student;
  final String? message;

  factory ApplicationCreateResponse.fromJson(Map<String, dynamic> json) {
    return ApplicationCreateResponse(
      application: json["application"] == null
          ? null
          : Application.fromJson(json["application"]),
      availableNextStatuses: json["availableNextStatuses"] == null
          ? []
          : List<dynamic>.from(json["availableNextStatuses"]!.map((x) => x)),
      uploadSlots: json["uploadSlots"] == null
          ? null
          : UploadSlots.fromJson(json["uploadSlots"]),
      fileDownloadToNextStatus: json["fileDownloadToNextStatus"],
      paginationInfo: json["paginationInfo"] == null
          ? null
          : PaginationInfo.fromJson(json["paginationInfo"]),
      applications: json["applications"] == null
          ? []
          : List<Application>.from(
              json["applications"]!.map((x) => Application.fromJson(x))),
      student:
          json["student"] == null ? null : Student.fromJson(json["student"]),
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() => {
        "application": application?.toJson(),
        "availableNextStatuses": availableNextStatuses.map((x) => x).toList(),
        "uploadSlots": uploadSlots?.toJson(),
        "fileDownloadToNextStatus": fileDownloadToNextStatus,
        "paginationInfo": paginationInfo?.toJson(),
        "applications": applications.map((x) => x?.toJson()).toList(),
        "student": student?.toJson(),
        "message": message,
      };
}
