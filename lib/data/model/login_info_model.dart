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
    final data = <String, dynamic>{};
    data['accessToken'] = accessToken;
    data['tokenType'] = tokenType;
    return data;
  }
}
