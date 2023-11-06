import 'package:applycamp/data/model/application_models/application.dart';
import 'package:applycamp/data/model/program_search_models/degrees.dart';
import 'package:applycamp/data/model/program_search_models/image.dart';
import 'package:applycamp/data/model/student_model/high_school_country.dart';
import 'package:applycamp/data/model/student_model/maker.dart';
import 'package:applycamp/data/model/student_model/student_can.dart';
import 'package:applycamp/data/model/student_model/student_document.dart';
import 'package:applycamp/data/model/user_model/user_status.dart';

class Student {
  Student({
    required this.id,
    required this.makerId,
    required this.nationalityId,
    required this.residenceId,
    required this.degreeId,
    required this.highSchoolCountryId,
    required this.email,
    required this.fullName,
    required this.name,
    required this.passportNumber,
    required this.passportDateOfIssue,
    required this.passportDateOfExpiry,
    required this.phone,
    required this.dateOfBirth,
    required this.gender,
    required this.martialStatus,
    required this.fatherName,
    required this.fatherPhone,
    required this.motherName,
    required this.highSchool,
    required this.gpa,
    required this.hasTcNumber,
    required this.isTransferred,
    required this.isTurkeyCitizen,
    required this.isVisaRequired,
    required this.statusSlug,
    required this.canHaveApplications,
    required this.isSelfRegistered,
    required this.isLoginAllowed,
    required this.can,
    required this.createdAt,
    required this.updatedAt,
    required this.maker,
    required this.nationality,
    required this.residenceCountry,
    required this.visaCountry,
    required this.degree,
    required this.highSchoolCountry,
    required this.image,
    required this.status,
    required this.profileImage,
    required this.documents,
    required this.applications,
  });

  final int id;
  final int? makerId;
  final int? nationalityId;
  final int? residenceId;
  final int? degreeId;
  final int? highSchoolCountryId;
  final String? email;
  final String? fullName;
  final String? name;
  final String? passportNumber;
  final String? passportDateOfIssue;
  final String? passportDateOfExpiry;
  final String? phone;
  final String? dateOfBirth;
  final String? gender;
  final String? martialStatus;
  final String? fatherName;
  final String? fatherPhone;
  final String? motherName;
  final String? highSchool;
  final int? gpa;
  final bool? hasTcNumber;
  final bool? isTransferred;
  final bool? isTurkeyCitizen;
  final bool? isVisaRequired;
  final String? statusSlug;
  final bool? canHaveApplications;
  final bool? isSelfRegistered;
  final bool? isLoginAllowed;
  final StudentCan? can;
  final String? createdAt;
  final String? updatedAt;
  final Maker? maker;
  final HighSchoolCountry? nationality;
  final HighSchoolCountry? residenceCountry;
  final List<dynamic> visaCountry;
  final Degree? degree;
  final HighSchoolCountry? highSchoolCountry;
  final Image? image;
  final UserStatus? status;
  final Image? profileImage;
  final List<StudentDocument> documents;
  final List<Application> applications;

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json["id"],
      makerId: json["makerId"],
      nationalityId: json["nationalityId"],
      residenceId: json["residenceId"],
      degreeId: json["degreeId"],
      highSchoolCountryId: json["highSchoolCountryId"],
      email: json["email"],
      fullName: json["fullName"],
      name: json["name"],
      passportNumber: json["passportNumber"],
      passportDateOfIssue: json["passportDateOfIssue"],
      passportDateOfExpiry: json["passportDateOfExpiry"],
      phone: json["phone"],
      dateOfBirth: json["dateOfBirth"],
      gender: json["gender"],
      martialStatus: json["martialStatus"],
      fatherName: json["fatherName"],
      fatherPhone: json["fatherPhone"],
      motherName: json["motherName"],
      highSchool: json["highSchool"],
      gpa: json["gpa"],
      hasTcNumber: json["hasTcNumber"],
      isTransferred: json["isTransferred"],
      isTurkeyCitizen: json["isTurkeyCitizen"],
      isVisaRequired: json["isVisaRequired"],
      statusSlug: json["statusSlug"],
      canHaveApplications: json["canHaveApplications"],
      isSelfRegistered: json["isSelfRegistered"],
      isLoginAllowed: json["isLoginAllowed"],
      can: json["can"] == null ? null : StudentCan.fromJson(json["can"]),
      createdAt: json["createdAt"],
      updatedAt: json["updatedAt"],
      maker: json["maker"] == null ? null : Maker.fromJson(json["maker"]),
      nationality: json["nationality"] == null
          ? null
          : HighSchoolCountry.fromJson(json["nationality"]),
      residenceCountry: json["residenceCountry"] == null
          ? null
          : HighSchoolCountry.fromJson(json["residenceCountry"]),
      visaCountry: json["visaCountry"] == null
          ? []
          : List<dynamic>.from(json["visaCountry"]!.map((x) => x)),
      degree: json["degree"] == null ? null : Degree.fromJson(json["degree"]),
      highSchoolCountry: json["highSchoolCountry"] == null
          ? null
          : HighSchoolCountry.fromJson(json["highSchoolCountry"]),
      image: json["image"] == null ? null : Image.fromJson(json["image"]),
      status:
          json["status"] == null ? null : UserStatus.fromJson(json["status"]),
      profileImage: json["profileImage"] == null
          ? null
          : Image.fromJson(json["profileImage"]),
      documents: json["documents"] == null
          ? []
          : List<StudentDocument>.from(
              json["documents"]!.map((x) => StudentDocument.fromJson(x))),
      applications: json["applications"] == null
          ? []
          : List<Application>.from(
              json["applications"]!.map((x) => Application.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "makerId": makerId,
        "nationalityId": nationalityId,
        "residenceId": residenceId,
        "degreeId": degreeId,
        "highSchoolCountryId": highSchoolCountryId,
        "email": email,
        "fullName": fullName,
        "name": name,
        "passportNumber": passportNumber,
        "passportDateOfIssue": passportDateOfIssue,
        "passportDateOfExpiry": passportDateOfExpiry,
        "phone": phone,
        "dateOfBirth": dateOfBirth,
        "gender": gender,
        "martialStatus": martialStatus,
        "fatherName": fatherName,
        "fatherPhone": fatherPhone,
        "motherName": motherName,
        "highSchool": highSchool,
        "gpa": gpa,
        "hasTcNumber": hasTcNumber,
        "isTransferred": isTransferred,
        "isTurkeyCitizen": isTurkeyCitizen,
        "isVisaRequired": isVisaRequired,
        "statusSlug": statusSlug,
        "canHaveApplications": canHaveApplications,
        "isSelfRegistered": isSelfRegistered,
        "isLoginAllowed": isLoginAllowed,
        "can": can?.toJson(),
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "maker": maker?.toJson(),
        "nationality": nationality?.toJson(),
        "residenceCountry": residenceCountry?.toJson(),
        "visaCountry": visaCountry.map((x) => x).toList(),
        "degree": degree?.toJson(),
        "highSchoolCountry": highSchoolCountry?.toJson(),
        "image": image?.toJson(),
        "status": status?.toJson(),
        "profileImage": profileImage?.toJson(),
        "documents": documents.map((x) => x.toJson()).toList(),
        "applications": applications.map((x) => x.toJson()).toList(),
      };
}
