import 'package:applycamp/data/model/application_models/document_type.dart';
import 'package:applycamp/data/model/file_element.dart';
import 'package:applycamp/data/model/student_model/student_document.dart';

class StudentCreateParams {
  StudentCreateParams({
    required this.nationalityId,
    required this.residenceId,
    required this.visaId,
    required this.highSchoolCountryId,
    required this.degreeId,
    required this.image,
    required this.email,
    required this.fullName,
    required this.phone,
    required this.passportNumber,
    required this.passportDateOfIssue,
    required this.passportDateOfExpiry,
    required this.dateOfBirth,
    required this.gender,
    required this.martialStatus,
    required this.fatherName,
    required this.fatherPhone,
    required this.motherName,
    required this.highSchool,
    required this.gpa,
    required this.tcNumber,
    required this.addressAbroad,
    required this.addressTurkey,
    required this.hasTcNumber,
    required this.isTransferred,
    required this.isTurkeyCitizen,
    required this.isVisaRequired,
    required this.isLoginAllowed,
    required this.password,
    required this.documents,
    required this.id,
  });

  final int? nationalityId;
  final int? residenceId;
  final int? visaId;
  final int? highSchoolCountryId;
  final int? degreeId;
  final FileElement? image;
  final String? email;
  final String? fullName;
  final String? phone;
  final String? passportNumber;
  final DateTime? passportDateOfIssue;
  final DateTime? passportDateOfExpiry;
  final DateTime? dateOfBirth;
  final String? gender;
  final String? martialStatus;
  final String? fatherName;
  final String? fatherPhone;
  final String? motherName;
  final String? highSchool;
  final double? gpa;
  final String? tcNumber;
  final String? addressAbroad;
  final String? addressTurkey;
  final bool? hasTcNumber;
  final bool? isTransferred;
  final bool? isTurkeyCitizen;
  final bool? isVisaRequired;
  final bool? isLoginAllowed;
  final String? password;
  final List<StudentDocument> documents;
  final int? id;

  factory StudentCreateParams.fromJson(Map<String, dynamic> json) {
    return StudentCreateParams(
      nationalityId: json["nationalityId"],
      residenceId: json["residenceId"],
      visaId: json["visaId"],
      highSchoolCountryId: json["highSchoolCountryId"],
      degreeId: json["degreeId"],
      image: json["image"] == null ? null : FileElement.fromJson(json["image"]),
      email: json["email"],
      fullName: json["fullName"],
      phone: json["phone"],
      passportNumber: json["passportNumber"],
      passportDateOfIssue: DateTime.tryParse(json["passportDateOfIssue"] ?? ""),
      passportDateOfExpiry:
          DateTime.tryParse(json["passportDateOfExpiry"] ?? ""),
      dateOfBirth: DateTime.tryParse(json["dateOfBirth"] ?? ""),
      gender: json["gender"],
      martialStatus: json["martialStatus"],
      fatherName: json["fatherName"],
      fatherPhone: json["fatherPhone"],
      motherName: json["motherName"],
      highSchool: json["highSchool"],
      gpa: json["gpa"],
      tcNumber: json["tcNumber"],
      addressAbroad: json["addressAbroad"],
      addressTurkey: json["addressTurkey"],
      hasTcNumber: json["hasTcNumber"],
      isTransferred: json["isTransferred"],
      isTurkeyCitizen: json["isTurkeyCitizen"],
      isVisaRequired: json["isVisaRequired"],
      isLoginAllowed: json["isLoginAllowed"],
      password: json["password"],
      documents: json["documents"] == null
          ? []
          : List<StudentDocument>.from(
              json["documents"]!.map((x) => StudentDocument.fromJson(x))),
      id: json["id"],
    );
  }

  Map<String, dynamic> toJson() => {
        if (nationalityId != null && nationalityId != '')
          "nationalityId": nationalityId,
        if (residenceId != null && residenceId != '')
          "residenceId": residenceId,
        if (visaId != null && visaId != '') "visaId": visaId,
        if (highSchoolCountryId != null && highSchoolCountryId != '')
          "highSchoolCountryId": highSchoolCountryId,
        if (degreeId != null && degreeId != '') "degreeId": degreeId,
        "image": image?.toJson(),
        if (email != null && email != '') "email": email,
        if (fullName != null && fullName != '') "fullName": fullName,
        if (phone != null && phone != '') "phone": phone,
        if (passportNumber != null && passportNumber != '')
          "passportNumber": passportNumber,
        if (passportDateOfIssue != null && passportDateOfIssue != '')
          "passportDateOfIssue":
              "${passportDateOfIssue!.year.toString().padLeft(4, '0')}-${passportDateOfIssue!.month.toString().padLeft(2, '0')}-${passportDateOfIssue!.day.toString().padLeft(2, '0')}",
        if (passportDateOfExpiry != null && passportDateOfExpiry != '')
          "passportDateOfExpiry":
              "${passportDateOfExpiry!.year.toString().padLeft(4, '0')}-${passportDateOfExpiry!.month.toString().padLeft(2, '0')}-${passportDateOfExpiry!.day.toString().padLeft(2, '0')}",
        if (dateOfBirth != null && dateOfBirth != '')
          "dateOfBirth":
              "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
        if (gender != null && gender != '') "gender": gender,
        if (martialStatus != null && martialStatus != '')
          "martialStatus": martialStatus,
        if (fatherName != null && fatherName != '') "fatherName": fatherName,
        if (fatherPhone != null && fatherPhone != '')
          "fatherPhone": fatherPhone,
        if (motherName != null && motherName != '') "motherName": motherName,
        if (highSchool != null && highSchool != '') "highSchool": highSchool,
        if (gpa != null && gpa != '') "gpa": gpa,
        if (tcNumber != null && tcNumber != '') "tcNumber": tcNumber,
        if (addressAbroad != null && addressAbroad != '')
          "addressAbroad": addressAbroad,
        if (addressTurkey != null && addressTurkey != '')
          "addressTurkey": addressTurkey,
        if (hasTcNumber != null && hasTcNumber != '')
          "hasTcNumber": hasTcNumber,
        if (isTransferred != null && isTransferred != '')
          "isTransferred": isTransferred,
        if (isTurkeyCitizen != null && isTurkeyCitizen != '')
          "isTurkeyCitizen": isTurkeyCitizen,
        if (isVisaRequired != null && isVisaRequired != '')
          "isVisaRequired": isVisaRequired,
        if (isLoginAllowed != null && isLoginAllowed != '')
          "isLoginAllowed": isLoginAllowed,
        if (password != null && password != '') "password": password,
        if (documents.isNotEmpty)
          "documents": documents.map((x) => x?.toJson()).toList(),
        "id": '0',
      };
}

class DocumentParam {
  DocumentParam({
    required this.type,
    required this.files,
  });

  final DocumentType? type;
  final List<FileElement> files;

  factory DocumentParam.fromJson(Map<String, dynamic> json) {
    return DocumentParam(
      type: json["type"] == null ? null : DocumentType.fromJson(json["type"]),
      files: json["files"] == null
          ? []
          : List<FileElement>.from(
              json["files"]!.map((x) => FileElement.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "type": type?.toJson(),
        "files": files.map((x) => x?.toJson()).toList(),
      };
}

class StudentImageParam {
  StudentImageParam({
    required this.id,
    required this.path,
    required this.uuid,
  });

  final int? id;
  final String? path;
  final String? uuid;

  factory StudentImageParam.fromJson(Map<String, dynamic> json) {
    return StudentImageParam(
      id: json["id"],
      path: json["path"],
      uuid: json["uuid"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "path": path,
        "uuid": uuid,
      };
}
