import 'package:applycamp/data/model/student_model/student_abilities_model.dart';

class Student {
  Student({
    required this.id,
    this.makerId,
    this.nationalityId,
    this.residenceId,
    this.visaId,
    this.degreeId,
    this.highSchoolCountryId,
    required this.email,
    required this.fullName,
    required this.name,
    required this.passportNumber,
    this.passportDateOfIssue,
    this.passportDateOfExpiry,
    this.phone,
    this.dateOfBirth,
    required this.gender,
    required this.martialStatus,
    required this.fatherName,
    this.fatherPhone,
    required this.motherName,
    this.highSchool,
    this.gpa,
    this.addressAbroad,
    this.addressTurkey,
    this.tcNumber,
    required this.hasTcNumber,
    required this.isTransferred,
    required this.isTurkeyCitizen,
    required this.isVisaRequired,
    this.statusSlug,
    required this.canHaveApplications,
    required this.isSelfRegistered,
    required this.isProfileFilled,
    this.abilities,
    required this.can,
    required this.createdAt,
    required this.updatedAt,
    required this.nationality,
    required this.residenceCountry,
    required this.visaCountry,
    required this.degree,
    required this.highSchoolCountry,
    required this.image,
    required this.status,
  });
  late final int id;
  late final makerId;
  late final nationalityId;
  late final residenceId;
  late final visaId;
  late final degreeId;
  late final highSchoolCountryId;
  late final String email;
  late final String fullName;
  late final String name;
  late final String? passportNumber;
  late final passportDateOfIssue;
  late final passportDateOfExpiry;
  late final phone;
  late final dateOfBirth;
  late final String gender;
  late final String martialStatus;
  late final String fatherName;
  late final fatherPhone;
  late final String motherName;
  late final highSchool;
  late final gpa;
  late final addressAbroad;
  late final addressTurkey;
  late final tcNumber;
  late final bool hasTcNumber;
  late final bool isTransferred;
  late final bool isTurkeyCitizen;
  late final bool isVisaRequired;
  late final statusSlug;
  late final bool canHaveApplications;
  late final bool isSelfRegistered;
  late final bool? isProfileFilled;
  late final abilities;
  late final StudentCan can;
  late final String createdAt;
  late final String updatedAt;
  late final List<dynamic> nationality;
  late final List<dynamic> residenceCountry;
  late final List<dynamic> visaCountry;
  late final List<dynamic> degree;
  late final List<dynamic> highSchoolCountry;
  late final List<dynamic> image;
  late final Map<dynamic, dynamic> status;

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    makerId = null;
    nationalityId = null;
    residenceId = null;
    visaId = null;
    degreeId = null;
    highSchoolCountryId = null;
    email = json['email'];
    fullName = json['fullName'];
    name = json['name'];
    passportNumber = json['passportNumber'];
    passportDateOfIssue = null;
    passportDateOfExpiry = null;
    phone = null;
    dateOfBirth = null;
    gender = json['gender'];
    martialStatus = json['martialStatus'];
    fatherName = json['fatherName'];
    fatherPhone = null;
    motherName = json['motherName'];
    highSchool = null;
    gpa = null;
    addressAbroad = null;
    addressTurkey = null;
    tcNumber = null;
    hasTcNumber = json['hasTcNumber'];
    isTransferred = json['isTransferred'];
    isTurkeyCitizen = json['isTurkeyCitizen'];
    isVisaRequired = json['isVisaRequired'];
    statusSlug = null;
    canHaveApplications = json['canHaveApplications'];
    isSelfRegistered = json['isSelfRegistered'];
    isProfileFilled = json['isProfileFilled'];
    abilities = null;
    can = StudentCan.fromJson(json['can']);
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    nationality = List.castFrom<dynamic, dynamic>(json['nationality']);
    residenceCountry =
        List.castFrom<dynamic, dynamic>(json['residenceCountry']);
    visaCountry = List.castFrom<dynamic, dynamic>(json['visaCountry']);
    degree = List.castFrom<dynamic, dynamic>(json['degree']);
    highSchoolCountry =
        List.castFrom<dynamic, dynamic>(json['highSchoolCountry']);
    image = List.castFrom<dynamic, dynamic>(json['image']);
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['makerId'] = makerId;
    _data['nationalityId'] = nationalityId;
    _data['residenceId'] = residenceId;
    _data['visaId'] = visaId;
    _data['degreeId'] = degreeId;
    _data['highSchoolCountryId'] = highSchoolCountryId;
    _data['email'] = email;
    _data['fullName'] = fullName;
    _data['name'] = name;
    _data['passportNumber'] = passportNumber;
    _data['passportDateOfIssue'] = passportDateOfIssue;
    _data['passportDateOfExpiry'] = passportDateOfExpiry;
    _data['phone'] = phone;
    _data['dateOfBirth'] = dateOfBirth;
    _data['gender'] = gender;
    _data['martialStatus'] = martialStatus;
    _data['fatherName'] = fatherName;
    _data['fatherPhone'] = fatherPhone;
    _data['motherName'] = motherName;
    _data['highSchool'] = highSchool;
    _data['gpa'] = gpa;
    _data['addressAbroad'] = addressAbroad;
    _data['addressTurkey'] = addressTurkey;
    _data['tcNumber'] = tcNumber;
    _data['hasTcNumber'] = hasTcNumber;
    _data['isTransferred'] = isTransferred;
    _data['isTurkeyCitizen'] = isTurkeyCitizen;
    _data['isVisaRequired'] = isVisaRequired;
    _data['statusSlug'] = statusSlug;
    _data['canHaveApplications'] = canHaveApplications;
    _data['isSelfRegistered'] = isSelfRegistered;
    _data['isProfileFilled'] = isProfileFilled;
    _data['abilities'] = abilities;
    _data['can'] = can.toJson();
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['nationality'] = nationality;
    _data['residenceCountry'] = residenceCountry;
    _data['visaCountry'] = visaCountry;
    _data['degree'] = degree;
    _data['highSchoolCountry'] = highSchoolCountry;
    _data['image'] = image;
    _data['status'] = status;
    return _data;
  }
}
