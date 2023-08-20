class StudentRegisterResponse {
  StudentRegisterResponse({
    required this.student,
    required this.message,
    required this.loginInfo,
  });
  late final Student student;
  late final String message;
  late final LoginInfo loginInfo;

  StudentRegisterResponse.fromJson(Map<String, dynamic> json) {
    student = Student.fromJson(json['student']);
    message = json['message'];
    loginInfo = LoginInfo.fromJson(json['loginInfo']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['student'] = student.toJson();
    _data['message'] = message;
    _data['loginInfo'] = loginInfo.toJson();
    return _data;
  }
}

class Student {
  Student({
    required this.nationality,
    required this.residenceCountry,
    required this.visaCountry,
    required this.highSchoolCountry,
    required this.degree,
    required this.image,
    required this.status,
    required this.documents,
    required this.id,
    required this.makerId,
    required this.nationalityId,
    required this.residenceId,
    required this.visaId,
    required this.degreeId,
    required this.highSchoolCountryId,
    required this.email,
    required this.fullName,
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
    required this.addressAbroad,
    required this.addressTurkey,
    required this.statusSlug,
    required this.canHaveApplications,
    required this.tcNumber,
    required this.hasTcNumber,
    required this.isTransferred,
    required this.isTurkeyCitizen,
    required this.isVisaRequired,
    required this.can,
    required this.createdAt,
    required this.updatedAt,
  });
  late final Nationality nationality;
  late final ResidenceCountry residenceCountry;
  late final VisaCountry visaCountry;
  late final HighSchoolCountry highSchoolCountry;
  late final Degree degree;
  late final Image image;
  late final Status status;
  late final Documents documents;
  late final int id;
  late final int makerId;
  late final int nationalityId;
  late final int residenceId;
  late final int visaId;
  late final int degreeId;
  late final int highSchoolCountryId;
  late final String email;
  late final String fullName;
  late final String passportNumber;
  late final String passportDateOfIssue;
  late final String passportDateOfExpiry;
  late final String phone;
  late final String dateOfBirth;
  late final String gender;
  late final String martialStatus;
  late final String fatherName;
  late final String fatherPhone;
  late final String motherName;
  late final String highSchool;
  late final double gpa;
  late final String addressAbroad;
  late final String addressTurkey;
  late final String statusSlug;
  late final bool canHaveApplications;
  late final String tcNumber;
  late final bool hasTcNumber;
  late final bool isTransferred;
  late final bool isTurkeyCitizen;
  late final bool isVisaRequired;
  late final Can can;
  late final String createdAt;
  late final String updatedAt;

  Student.fromJson(Map<String, dynamic> json) {
    nationality = Nationality.fromJson(json['nationality']);
    residenceCountry = ResidenceCountry.fromJson(json['residenceCountry']);
    visaCountry = VisaCountry.fromJson(json['visaCountry']);
    highSchoolCountry = HighSchoolCountry.fromJson(json['highSchoolCountry']);
    degree = Degree.fromJson(json['degree']);
    image = Image.fromJson(json['image']);
    status = Status.fromJson(json['status']);
    documents = Documents.fromJson(json['documents']);
    id = json['id'];
    makerId = json['makerId'];
    nationalityId = json['nationalityId'];
    residenceId = json['residenceId'];
    visaId = json['visaId'];
    degreeId = json['degreeId'];
    highSchoolCountryId = json['highSchoolCountryId'];
    email = json['email'];
    fullName = json['fullName'];
    passportNumber = json['passportNumber'];
    passportDateOfIssue = json['passportDateOfIssue'];
    passportDateOfExpiry = json['passportDateOfExpiry'];
    phone = json['phone'];
    dateOfBirth = json['dateOfBirth'];
    gender = json['gender'];
    martialStatus = json['martialStatus'];
    fatherName = json['fatherName'];
    fatherPhone = json['fatherPhone'];
    motherName = json['motherName'];
    highSchool = json['highSchool'];
    gpa = json['gpa'];
    addressAbroad = json['addressAbroad'];
    addressTurkey = json['addressTurkey'];
    statusSlug = json['statusSlug'];
    canHaveApplications = json['canHaveApplications'];
    tcNumber = json['tcNumber'];
    hasTcNumber = json['hasTcNumber'];
    isTransferred = json['isTransferred'];
    isTurkeyCitizen = json['isTurkeyCitizen'];
    isVisaRequired = json['isVisaRequired'];
    can = Can.fromJson(json['can']);
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['nationality'] = nationality.toJson();
    _data['residenceCountry'] = residenceCountry.toJson();
    _data['visaCountry'] = visaCountry.toJson();
    _data['highSchoolCountry'] = highSchoolCountry.toJson();
    _data['degree'] = degree.toJson();
    _data['image'] = image.toJson();
    _data['status'] = status.toJson();
    _data['documents'] = documents.toJson();
    _data['id'] = id;
    _data['makerId'] = makerId;
    _data['nationalityId'] = nationalityId;
    _data['residenceId'] = residenceId;
    _data['visaId'] = visaId;
    _data['degreeId'] = degreeId;
    _data['highSchoolCountryId'] = highSchoolCountryId;
    _data['email'] = email;
    _data['fullName'] = fullName;
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
    _data['statusSlug'] = statusSlug;
    _data['canHaveApplications'] = canHaveApplications;
    _data['tcNumber'] = tcNumber;
    _data['hasTcNumber'] = hasTcNumber;
    _data['isTransferred'] = isTransferred;
    _data['isTurkeyCitizen'] = isTurkeyCitizen;
    _data['isVisaRequired'] = isVisaRequired;
    _data['can'] = can.toJson();
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    return _data;
  }
}

class Nationality {
  Nationality({
    required this.id,
    required this.continentCode,
    required this.name,
    required this.code,
    required this.iso3,
    required this.number,
    required this.fullName,
  });
  late final int id;
  late final String continentCode;
  late final String name;
  late final String code;
  late final String iso3;
  late final String number;
  late final String fullName;

  Nationality.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    continentCode = json['continentCode'];
    name = json['name'];
    code = json['code'];
    iso3 = json['iso3'];
    number = json['number'];
    fullName = json['fullName'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['continentCode'] = continentCode;
    _data['name'] = name;
    _data['code'] = code;
    _data['iso3'] = iso3;
    _data['number'] = number;
    _data['fullName'] = fullName;
    return _data;
  }
}

class ResidenceCountry {
  ResidenceCountry({
    required this.id,
    required this.continentCode,
    required this.name,
    required this.code,
    required this.iso3,
    required this.number,
    required this.fullName,
  });
  late final int id;
  late final String continentCode;
  late final String name;
  late final String code;
  late final String iso3;
  late final String number;
  late final String fullName;

  ResidenceCountry.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    continentCode = json['continentCode'];
    name = json['name'];
    code = json['code'];
    iso3 = json['iso3'];
    number = json['number'];
    fullName = json['fullName'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['continentCode'] = continentCode;
    _data['name'] = name;
    _data['code'] = code;
    _data['iso3'] = iso3;
    _data['number'] = number;
    _data['fullName'] = fullName;
    return _data;
  }
}

class VisaCountry {
  VisaCountry({
    required this.id,
    required this.continentCode,
    required this.name,
    required this.code,
    required this.iso3,
    required this.number,
    required this.fullName,
  });
  late final int id;
  late final String continentCode;
  late final String name;
  late final String code;
  late final String iso3;
  late final String number;
  late final String fullName;

  VisaCountry.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    continentCode = json['continentCode'];
    name = json['name'];
    code = json['code'];
    iso3 = json['iso3'];
    number = json['number'];
    fullName = json['fullName'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['continentCode'] = continentCode;
    _data['name'] = name;
    _data['code'] = code;
    _data['iso3'] = iso3;
    _data['number'] = number;
    _data['fullName'] = fullName;
    return _data;
  }
}

class HighSchoolCountry {
  HighSchoolCountry({
    required this.id,
    required this.continentCode,
    required this.name,
    required this.code,
    required this.iso3,
    required this.number,
    required this.fullName,
  });
  late final int id;
  late final String continentCode;
  late final String name;
  late final String code;
  late final String iso3;
  late final String number;
  late final String fullName;

  HighSchoolCountry.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    continentCode = json['continentCode'];
    name = json['name'];
    code = json['code'];
    iso3 = json['iso3'];
    number = json['number'];
    fullName = json['fullName'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['continentCode'] = continentCode;
    _data['name'] = name;
    _data['code'] = code;
    _data['iso3'] = iso3;
    _data['number'] = number;
    _data['fullName'] = fullName;
    return _data;
  }
}

class Degree {
  Degree({
    required this.id,
    required this.title,
    required this.order,
  });
  late final int id;
  late final Title title;
  late final int order;

  Degree.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = Title.fromJson(json['title']);
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title.toJson();
    _data['order'] = order;
    return _data;
  }
}

class Title {
  Title({
    required this.fa,
    required this.en,
  });
  late final String fa;
  late final String en;

  Title.fromJson(Map<String, dynamic> json) {
    fa = json['fa'];
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['fa'] = fa;
    _data['en'] = en;
    return _data;
  }
}

class Image {
  Image({
    required this.id,
    required this.path,
    required this.uuid,
    required this.name,
    required this.mime,
    required this.extension,
    required this.note,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String path;
  late final String uuid;
  late final String name;
  late final String mime;
  late final String extension;
  late final String note;
  late final String createdAt;
  late final String updatedAt;

  Image.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    path = json['path'];
    uuid = json['uuid'];
    name = json['name'];
    mime = json['mime'];
    extension = json['extension'];
    note = json['note'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['path'] = path;
    _data['uuid'] = uuid;
    _data['name'] = name;
    _data['mime'] = mime;
    _data['extension'] = extension;
    _data['note'] = note;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    return _data;
  }
}

class Status {
  Status({
    required this.slug,
    required this.title,
    required this.order,
    required this.bgColor,
    required this.textColor,
    required this.isError,
  });
  late final String slug;
  late final Title title;
  late final int order;
  late final String bgColor;
  late final String textColor;
  late final bool isError;

  Status.fromJson(Map<String, dynamic> json) {
    slug = json['slug'];
    title = Title.fromJson(json['title']);
    order = json['order'];
    bgColor = json['bgColor'];
    textColor = json['textColor'];
    isError = json['isError'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['slug'] = slug;
    _data['title'] = title.toJson();
    _data['order'] = order;
    _data['bgColor'] = bgColor;
    _data['textColor'] = textColor;
    _data['isError'] = isError;
    return _data;
  }
}

class Documents {
  Documents({
    required this.id,
    required this.type,
    required this.files,
  });
  late final int id;
  late final Type type;
  late final List<Files> files;

  Documents.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = Type.fromJson(json['type']);
    files = List.from(json['files']).map((e) => Files.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['type'] = type.toJson();
    _data['files'] = files.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Type {
  Type({
    required this.id,
    required this.title,
    required this.order,
  });
  late final int id;
  late final Title title;
  late final int order;

  Type.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = Title.fromJson(json['title']);
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title.toJson();
    _data['order'] = order;
    return _data;
  }
}

class Files {
  Files({
    required this.id,
    required this.path,
    required this.uuid,
    required this.name,
    required this.mime,
    required this.extension,
    required this.note,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String path;
  late final String uuid;
  late final String name;
  late final String mime;
  late final String extension;
  late final String note;
  late final String createdAt;
  late final String updatedAt;

  Files.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    path = json['path'];
    uuid = json['uuid'];
    name = json['name'];
    mime = json['mime'];
    extension = json['extension'];
    note = json['note'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['path'] = path;
    _data['uuid'] = uuid;
    _data['name'] = name;
    _data['mime'] = mime;
    _data['extension'] = extension;
    _data['note'] = note;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    return _data;
  }
}

class Can {
  Can({
    required this.update,
    required this.delete,
    required this.changeMaker,
    required this.changeStatus,
  });
  late final bool update;
  late final bool delete;
  late final bool changeMaker;
  late final bool changeStatus;

  Can.fromJson(Map<String, dynamic> json) {
    update = json['update'];
    delete = json['delete'];
    changeMaker = json['changeMaker'];
    changeStatus = json['changeStatus'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['update'] = update;
    _data['delete'] = delete;
    _data['changeMaker'] = changeMaker;
    _data['changeStatus'] = changeStatus;
    return _data;
  }
}

class LoginInfo {
  LoginInfo({
    required this.accessToken,
    required this.tokenType,
  });
  late final String accessToken;
  late final String tokenType;

  LoginInfo.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    tokenType = json['tokenType'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['accessToken'] = accessToken;
    _data['tokenType'] = tokenType;
    return _data;
  }
}
