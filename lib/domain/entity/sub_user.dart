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
  late final String name;
  late final String password;
  late final String email;
  late final bool canViewCommissions;
  late final String organization;
  late final String phone;
  late final int commissionPercentage;
  late final bool canAddSubUsers;
}
