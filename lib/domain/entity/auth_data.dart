class AuthData {
  final String? key;
  final String? name;
  final String? accessToken;
  // thinking on these two yet
  final int? userRoleId;

  AuthData({
    this.key,
    this.name,
    this.accessToken,
    this.userRoleId,
  });
}
