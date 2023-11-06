class SubUserEntity {
  SubUserEntity({
    required this.name,
    required this.password,
    required this.email,
    required this.canViewCommissions,
    required this.organization,
    required this.phone,
    required this.commissionPercentage,
    required this.canAddSubUsers,
  });
  final String name;
  final String password;
  final String email;
  final String organization;
  final String phone;
  final int commissionPercentage;
  final bool canViewCommissions;
  final bool canAddSubUsers;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['password'] = password;
    data['email'] = email;
    data['canViewCommissions'] = canViewCommissions;
    data['organization'] = organization;
    data['phone'] = phone;
    data['commissionPercentage'] = commissionPercentage;
    data['canAddSubUsers'] = canAddSubUsers;
    return data;
  }
}
