import 'package:applycamp/data/model/user_model/profile_image.dart';
import 'package:applycamp/data/model/user_model/role.dart';
import 'package:applycamp/data/model/user_model/user_status.dart';
import 'package:applycamp/data/model/user_model/user_can.dart';

class User {
  User({
    required this.id,
    required this.roleId,
    required this.isSubUser,
    required this.name,
    required this.email,
    required this.phone,
    required this.organization,
    required this.canAddApplications,
    required this.canAddStudents,
    required this.canViewCommissions,
    required this.commissionPercentage,
    required this.canAddSubUsers,
    required this.subUserLevel,
    required this.isSelfRegisterResponsible,
    required this.can,
    required this.createdAt,
    required this.updatedAt,
    required this.role,
    this.profileImage,
    required this.parent,
    required this.status,
  });
  late final int id;
  late final int roleId;
  late final bool isSubUser;
  late final String name;
  late final String email;
  late final String phone;
  late final String organization;
  late final bool canAddApplications;
  late final int canAddStudents;
  late final bool canViewCommissions;
  late final int commissionPercentage;
  late final bool canAddSubUsers;
  late final int subUserLevel;
  late final bool isSelfRegisterResponsible;
  late final UserCan can;
  late final String createdAt;
  late final String updatedAt;
  late final Role role;
  late final ProfileImage? profileImage;
  late final List<dynamic> parent;
  late final UserStatus status;

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roleId = json['roleId'];
    isSubUser = json['isSubUser'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    organization = json['organization'];
    canAddApplications = json['canAddApplications'];
    canAddStudents = json['canAddStudents'];
    canViewCommissions = json['canViewCommissions'];
    commissionPercentage = json['commissionPercentage'];
    canAddSubUsers = json['canAddSubUsers'];
    subUserLevel = json['subUserLevel'];
    isSelfRegisterResponsible = json['isSelfRegisterResponsible'];
    can = UserCan.fromJson(json['can']);
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    role = Role.fromJson(json['role']);
    profileImage = json['profileImage'].runtimeType != List
        ? ProfileImage.fromJson(json['profileImage'])
        : null;
    parent = List.castFrom<dynamic, dynamic>(json['parent']);
    status = UserStatus.fromJson(json['status']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['roleId'] = roleId;
    _data['isSubUser'] = isSubUser;
    _data['name'] = name;
    _data['email'] = email;
    _data['phone'] = phone;
    _data['organization'] = organization;
    _data['canAddApplications'] = canAddApplications;
    _data['canAddStudents'] = canAddStudents;
    _data['canViewCommissions'] = canViewCommissions;
    _data['commissionPercentage'] = commissionPercentage;
    _data['canAddSubUsers'] = canAddSubUsers;
    _data['subUserLevel'] = subUserLevel;
    _data['isSelfRegisterResponsible'] = isSelfRegisterResponsible;
    _data['can'] = can.toJson();
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['role'] = role.toJson();
    _data['profileImage'] = profileImage?.toJson();
    _data['parent'] = parent;
    _data['status'] = status.toJson();
    return _data;
  }
}
