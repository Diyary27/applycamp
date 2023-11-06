import 'package:applycamp/data/model/login_info_model.dart';
import 'package:applycamp/data/model/user_model/user.dart';

class UserAuthResponse {
  UserAuthResponse({
    required this.loginInfo,
    required this.user,
    required this.message,
  });
  late final LoginInfo loginInfo;
  late final User user;
  late final String message;

  UserAuthResponse.fromJson(Map<String, dynamic> json) {
    loginInfo = LoginInfo.fromJson(json['loginInfo']);
    user = User.fromJson(json['user']);
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['loginInfo'] = loginInfo.toJson();
    data['user'] = user.toJson();
    data['message'] = message;
    return data;
  }
}
