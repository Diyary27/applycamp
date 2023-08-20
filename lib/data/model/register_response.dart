class RegisterResponse {
  RegisterResponse({
    required this.user,
    required this.message,
    required this.loginInfo,
  });
  late final User user;
  late final String message;
  late final LoginInfo loginInfo;

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    user = User.fromJson(json['user']);
    message = json['message'];
    loginInfo = LoginInfo.fromJson(json['loginInfo']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user'] = user.toJson();
    _data['message'] = message;
    _data['loginInfo'] = loginInfo.toJson();
    return _data;
  }
}

class User {
  User({
    required this.id,
    required this.email,
    required this.name,
    required this.phone,
    required this.canViewCommissions,
    required this.canAddSubUsers,
    required this.isSubUser,
    required this.commissionPercentage,
    required this.subUserLevel,
    required this.organization,
    required this.permissions,
    required this.can,
    required this.abilities,
    required this.createdAt,
    required this.updatedAt,
    required this.role,
    required this.profileImage,
    required this.parent,
    required this.status,
  });
  late final int id;
  late final String email;
  late final String name;
  late final String phone;
  late final bool canViewCommissions;
  late final bool canAddSubUsers;
  late final bool isSubUser;
  late final int commissionPercentage;
  late final int subUserLevel;
  late final String organization;
  late final Permissions permissions;
  late final Can can;
  late final Abilities abilities;
  late final String createdAt;
  late final String updatedAt;
  late final Role role;
  late final ProfileImage profileImage;
  late final String parent;
  late final Status status;

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    canViewCommissions = json['canViewCommissions'];
    canAddSubUsers = json['canAddSubUsers'];
    isSubUser = json['isSubUser'];
    commissionPercentage = json['commissionPercentage'];
    subUserLevel = json['subUserLevel'];
    organization = json['organization'];
    permissions = Permissions.fromJson(json['permissions']);
    can = Can.fromJson(json['can']);
    abilities = Abilities.fromJson(json['abilities']);
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    role = Role.fromJson(json['role']);
    profileImage = ProfileImage.fromJson(json['profileImage']);
    parent = json['parent'];
    status = Status.fromJson(json['status']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['email'] = email;
    _data['name'] = name;
    _data['phone'] = phone;
    _data['canViewCommissions'] = canViewCommissions;
    _data['canAddSubUsers'] = canAddSubUsers;
    _data['isSubUser'] = isSubUser;
    _data['commissionPercentage'] = commissionPercentage;
    _data['subUserLevel'] = subUserLevel;
    _data['organization'] = organization;
    _data['permissions'] = permissions.toJson();
    _data['can'] = can.toJson();
    _data['abilities'] = abilities.toJson();
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['role'] = role.toJson();
    _data['profileImage'] = profileImage.toJson();
    _data['parent'] = parent;
    _data['status'] = status.toJson();
    return _data;
  }
}

class Permissions {
  Permissions({
    required this.id,
    required this.name,
  });
  late final int id;
  late final String name;

  Permissions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    return _data;
  }
}

class Can {
  Can({
    required this.update,
    required this.delete,
  });
  late final bool update;
  late final bool delete;

  Can.fromJson(Map<String, dynamic> json) {
    update = json['update'];
    delete = json['delete'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['update'] = update;
    _data['delete'] = delete;
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
    required this.createStudent,
    required this.createApplication,
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
  late final bool createStudent;
  late final bool createApplication;

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
    createStudent = json['createStudent'];
    createApplication = json['createApplication'];
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
    _data['createStudent'] = createStudent;
    _data['createApplication'] = createApplication;
    return _data;
  }
}

class Role {
  Role({
    required this.id,
    required this.title,
  });
  late final int id;
  late final Title title;

  Role.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = Title.fromJson(json['title']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title.toJson();
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

class ProfileImage {
  ProfileImage({
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

  ProfileImage.fromJson(Map<String, dynamic> json) {
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
    required this.isError,
  });
  late final String slug;
  late final Title title;
  late final int order;
  late final String bgColor;
  late final bool isError;

  Status.fromJson(Map<String, dynamic> json) {
    slug = json['slug'];
    title = Title.fromJson(json['title']);
    order = json['order'];
    bgColor = json['bgColor'];
    isError = json['isError'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['slug'] = slug;
    _data['title'] = title.toJson();
    _data['order'] = order;
    _data['bgColor'] = bgColor;
    _data['isError'] = isError;
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
