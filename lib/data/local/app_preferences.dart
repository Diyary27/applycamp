import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  static const String fullNameKey = "fullName";
  static const String accessTokenKey = "accessToken";

  AppPreferences(this._sharedPreferences);

  Future setFullName(String fullName) async {
    return _sharedPreferences.setString(fullNameKey, fullName);
  }

  Future getFullName() async {
    return _sharedPreferences.getString(fullNameKey) ?? null;
  }

  Future saveAccessToken(String accessToken) async {
    return _sharedPreferences.setString(accessTokenKey, accessToken);
  }

  Future loadAccessToken() async {
    return _sharedPreferences.getString(accessTokenKey) ?? null;
  }

  Future clear() async {
    return _sharedPreferences.clear();
  }
}
