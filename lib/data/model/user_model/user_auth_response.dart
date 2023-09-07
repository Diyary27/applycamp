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
    final _data = <String, dynamic>{};
    _data['loginInfo'] = loginInfo.toJson();
    _data['user'] = user.toJson();
    _data['message'] = message;
    return _data;
  }
}
