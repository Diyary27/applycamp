import 'package:applycamp/domain/entity/auth_data.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  // Future setFullName(
  //     {required String fullNameKey, required String fullName}) async {
  //   return _sharedPreferences.setString(fullNameKey, fullName);
  // }

  // Future getFullName(fullNameKey) async {
  //   return _sharedPreferences.getString(fullNameKey) ?? null;
  // }

  // Future saveAccessToken(
  //     {required String accessTokenKey, required String accessToken}) async {
  //   return _sharedPreferences.setString(accessTokenKey, accessToken);
  // }

  // Future loadAccessToken(accessTokenKey) async {
  //   return _sharedPreferences.getString(accessTokenKey) ?? null;
  // }

  Future setAuthInfos(String id, List<String> infos) async {
    final keyId = 'auth_' + id.toString();
    return _sharedPreferences.setStringList(keyId, infos);
  }

  // موقت
  Future setLoginInfo(String id, List<String> infos) async {
    final keyId = 'login_' + id.toString();
    return _sharedPreferences.setStringList(keyId, infos);
  }

  Future getLoginInfo(String id) async {
    final keyId = 'login_' + id.toString();

    final loginInfo = await _sharedPreferences.getStringList(keyId);

    return loginInfo;
  }

  Future getAuthInfos(String key) async {
    // in the list first one is name and second one is accessToken
    // we have a model like this "auth_id" -> [[0]name, [1]accessToken]
    final List? authInfos = await _sharedPreferences.getStringList(key);

    return authInfos;
  }

  Future<List<AuthData>> getAllAuthInfos() async {
    final authKeys = await _sharedPreferences
        .getKeys()
        .where((element) => element.contains('auth'));
    final List<AuthData> authData = [];
    authKeys.forEach((key) {
      authData.add(AuthData(
          key: key,
          name: _sharedPreferences.getStringList(key)?[0],
          accessToken: _sharedPreferences.getStringList(key)?[1]));
    });

    return authData;
  }

  Future clearUserAuthInfo(String key) async {
    return _sharedPreferences.remove(key);
  }
}
