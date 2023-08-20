class StudentRegisterRequest {
  StudentRegisterRequest({
    required this.password,
    required this.documents,
    required this.image,
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
    required this.tcNumber,
    required this.hasTcNumber,
    required this.isTransferred,
    required this.isTurkeyCitizen,
    required this.isVisaRequired,
    required this.can,
  });

  late final String password;
  late final List<Documents> documents;
  late final Image image;
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
  late final String tcNumber;
  late final bool hasTcNumber;
  late final bool isTransferred;
  late final bool isTurkeyCitizen;
  late final bool isVisaRequired;
  late final Can can;

  StudentRegisterRequest.fromJson(Map<String, dynamic> json) {
    password = json['password'];
    documents =
        List.from(json['documents']).map((e) => Documents.fromJson(e)).toList();
    image = Image.fromJson(json['image']);
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
    tcNumber = json['tcNumber'];
    hasTcNumber = json['hasTcNumber'];
    isTransferred = json['isTransferred'];
    isTurkeyCitizen = json['isTurkeyCitizen'];
    isVisaRequired = json['isVisaRequired'];
    can = Can.fromJson(json['can']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['password'] = password;
    _data['documents'] = documents.map((e) => e.toJson()).toList();
    _data['image'] = image.toJson();
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
    _data['tcNumber'] = tcNumber;
    _data['hasTcNumber'] = hasTcNumber;
    _data['isTransferred'] = isTransferred;
    _data['isTurkeyCitizen'] = isTurkeyCitizen;
    _data['isVisaRequired'] = isVisaRequired;
    _data['can'] = can.toJson();
    return _data;
  }
}

class Documents {
  Documents({
    required this.type,
    required this.files,
  });
  late final Type type;
  late final List<Files> files;

  Documents.fromJson(Map<String, dynamic> json) {
    type = Type.fromJson(json['type']);
    files = List.from(json['files']).map((e) => Files.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type.toJson();
    _data['files'] = files.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Type {
  Type({
    required this.id,
  });
  late final int id;

  Type.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    return _data;
  }
}

class Files {
  Files({
    required this.id,
    required this.uuid,
  });
  late final int id;
  late final String uuid;

  Files.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['uuid'] = uuid;
    return _data;
  }
}

class Image {
  Image({
    required this.id,
    required this.uuid,
  });
  late final int id;
  late final String uuid;

  Image.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['uuid'] = uuid;
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
