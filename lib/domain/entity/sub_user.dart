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
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['password'] = password;
    _data['email'] = email;
    _data['canViewCommissions'] = canViewCommissions;
    _data['organization'] = organization;
    _data['phone'] = phone;
    _data['commissionPercentage'] = commissionPercentage;
    _data['canAddSubUsers'] = canAddSubUsers;
    return _data;
  }
}
