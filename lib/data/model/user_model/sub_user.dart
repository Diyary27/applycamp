import 'package:applycamp/data/model/program_search_models/abilities.dart';
import 'package:applycamp/data/model/user_model/parent.dart';
import 'package:applycamp/data/model/user_model/role.dart';

class SubUser {
  SubUser({
    required this.id,
    required this.roleId,
    required this.parentId,
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
    required this.profileImage,
    required this.parent,
  });
  late final int id;
  late final int roleId;
  late final int parentId;
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
  late final Can can;
  late final String createdAt;
  late final String updatedAt;
  late final Role role;
  late final List<dynamic> profileImage;
  late final Parent parent;

  SubUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roleId = json['roleId'];
    parentId = json['parentId'];
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
    can = Can.fromJson(json['can']);
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    role = Role.fromJson(json['role']);
    profileImage = List.castFrom<dynamic, dynamic>(json['profileImage']);
    parent = Parent.fromJson(json['parent']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['roleId'] = roleId;
    data['parentId'] = parentId;
    data['isSubUser'] = isSubUser;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['organization'] = organization;
    data['canAddApplications'] = canAddApplications;
    data['canAddStudents'] = canAddStudents;
    data['canViewCommissions'] = canViewCommissions;
    data['commissionPercentage'] = commissionPercentage;
    data['canAddSubUsers'] = canAddSubUsers;
    data['subUserLevel'] = subUserLevel;
    data['isSelfRegisterResponsible'] = isSelfRegisterResponsible;
    data['can'] = can.toJson();
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['role'] = role.toJson();
    data['profileImage'] = profileImage;
    data['parent'] = parent.toJson();
    return data;
  }
}
