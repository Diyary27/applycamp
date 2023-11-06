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
    final data = <String, dynamic>{};
    data['update'] = update;
    data['delete'] = delete;
    data['changeStatus'] = changeStatus;
    return data;
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
    final data = <String, dynamic>{};
    data['createUser'] = createUser;
    data['createCountry'] = createCountry;
    data['createCity'] = createCity;
    data['createStudyLanguage'] = createStudyLanguage;
    data['createStudyField'] = createStudyField;
    data['createSpeciality'] = createSpeciality;
    data['createSchool'] = createSchool;
    data['createProgram'] = createProgram;
    data['createAnnouncement'] = createAnnouncement;
    data['createAcademicYear'] = createAcademicYear;
    data['addProgramToSchool'] = addProgramToSchool;
    data['removeProgramFromSchool'] = removeProgramFromSchool;
    data['createApplication'] = createApplication;
    data['createStudent'] = createStudent;
    return data;
  }
}
