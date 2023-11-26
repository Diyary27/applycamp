import 'package:applycamp/domain/entity/auth_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  // موقت
  Future setLoginInfo(String id, List<String> infos) async {
    final keyId = 'login_$id';
    return _sharedPreferences.setStringList(keyId, infos);
  }

  Future getLoginInfo(String id) async {
    final keyId = 'login_$id';

    final loginInfo = _sharedPreferences.getStringList(keyId);

    return loginInfo;
  }

  Future setprofileImagePath(String id, String profileImagePath) async {
    final keyId = 'image_$id';
    return _sharedPreferences.setString(keyId, profileImagePath);
  }

  Future getProfileImagePath(String id) async {
    final keyId = 'image_$id';
    return _sharedPreferences.getString(keyId);
  }

  Future setAuthInfos(String id, List<String> infos) async {
    final keyId = 'auth_$id';
    return _sharedPreferences.setStringList(keyId, infos);
  }

  Future getAuthInfos(String id) async {
    // in the list first one is name and second one is accessToken
    // we have a model like this "auth_id" -> [[0]name, [1]accessToken, [2]role id, [3] profileImage Path]
    final keyId = 'auth_$id';
    final List? authInfos = _sharedPreferences.getStringList(keyId);

    return authInfos;
  }

  Future<List<AuthData>> getAllAuthInfos() async {
    final authKeys = _sharedPreferences
        .getKeys()
        .where((element) => element.contains('auth'));
    final List<AuthData> authData = [];
    for (var key in authKeys) {
      authData.add(AuthData(
        key: key,
        name: _sharedPreferences.getStringList(key)?[0],
        accessToken: _sharedPreferences.getStringList(key)?[1],
        userRoleId: _sharedPreferences.getStringList(key)?[2] != null
            ? int.parse(_sharedPreferences.getStringList(key)![2])
            : null,
        profileImagePath: _sharedPreferences.getStringList(key)?[3],
      ));
    }

    return authData;
  }

  Future clearUserAuthInfo(String key) async {
    return _sharedPreferences.remove(key);
  }
}
