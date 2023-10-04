class UserCan {
  UserCan({
    required this.update,
    required this.delete,
    required this.changeStatus,
  });
  late final bool update;
  late final bool delete;
  late final bool changeStatus;

  UserCan.fromJson(Map<String, dynamic> json) {
    update = json['update'];
    delete = json['delete'];
    changeStatus = json['changeStatus'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['update'] = update;
    _data['delete'] = delete;
    _data['changeStatus'] = changeStatus;
    return _data;
  }
}

class Abilities {
  Abilities({
    required this.createUser,
    required this.createCountry,
    required this.createCity,
    required this.createStudyLanguage,
    required this.createStudyField,
    required this.createSpeciality,
    required this.createSchool,
    required this.createProgram,
    required this.createAnnouncement,
    required this.createAcademicYear,
    required this.addProgramToSchool,
    required this.removeProgramFromSchool,
    required this.createApplication,
    required this.createStudent,
  });
  late final bool createUser;
  late final bool createCountry;
  late final bool createCity;
  late final bool createStudyLanguage;
  late final bool createStudyField;
  late final bool createSpeciality;
  late final bool createSchool;
  late final bool createProgram;
  late final bool createAnnouncement;
  late final bool createAcademicYear;
  late final bool addProgramToSchool;
  late final bool removeProgramFromSchool;
  late final bool createApplication;
  late final bool createStudent;

  Abilities.fromJson(Map<String, dynamic> json) {
    createUser = json['createUser'];
    createCountry = json['createCountry'];
    createCity = json['createCity'];
    createStudyLanguage = json['createStudyLanguage'];
    createStudyField = json['createStudyField'];
    createSpeciality = json['createSpeciality'];
    createSchool = json['createSchool'];
    createProgram = json['createProgram'];
    createAnnouncement = json['createAnnouncement'];
    createAcademicYear = json['createAcademicYear'];
    addProgramToSchool = json['addProgramToSchool'];
    removeProgramFromSchool = json['removeProgramFromSchool'];
    createApplication = json['createApplication'];
    createStudent = json['createStudent'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['createUser'] = createUser;
    _data['createCountry'] = createCountry;
    _data['createCity'] = createCity;
    _data['createStudyLanguage'] = createStudyLanguage;
    _data['createStudyField'] = createStudyField;
    _data['createSpeciality'] = createSpeciality;
    _data['createSchool'] = createSchool;
    _data['createProgram'] = createProgram;
    _data['createAnnouncement'] = createAnnouncement;
    _data['createAcademicYear'] = createAcademicYear;
    _data['addProgramToSchool'] = addProgramToSchool;
    _data['removeProgramFromSchool'] = removeProgramFromSchool;
    _data['createApplication'] = createApplication;
    _data['createStudent'] = createStudent;
    return _data;
  }
}
