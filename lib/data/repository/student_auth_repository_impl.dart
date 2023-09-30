import 'package:applycamp/data/local/app_preferences.dart';
import 'package:applycamp/data/model/student_model/student_auth_response.dart';
import 'package:applycamp/data/source/student_auth_data_source.dart';
import 'package:applycamp/di/service_locator.dart';
import 'package:applycamp/domain/repository/student_auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentAuthRepositoryImpl implements StudentAuthRepository {
  final StudentAuthDataSource dataSource;
  final AppPreferences appPreferences;

  StudentAuthRepositoryImpl(this.dataSource, this.appPreferences);

  @override
  Future login(String email, String password) async {
    final authResponse = await dataSource.login(email, password);

    await persistAuth(authResponse);
    return authResponse;
  }

  @override
  Future register(
      {required String fullName,
      required String email,
      required String password,
      required String gender,
      required String phone}) async {
    final authResponse =
        await dataSource.register(fullName, email, password, gender, phone);

    await persistAuth(authResponse);
    return authResponse;
  }

  @override
  Future sendForgotPassEmail(String email) async =>
      await dataSource.sendForgotPassEmail(email);

  @override
  Future logout(String key) async {
    userKeyNotifier.value = null;
    accessTokenNotifier.value = null;
    userFullNameNotifier.value = null;
    await appPreferences.clearUserAuthInfo(key);
    loadAllAuthInfos();
  }

  Future persistAuth(StudentAuthResponse authResponse) async {
    final id = authResponse.student.id.toString();
    final infos = [
      authResponse.student.name,
      authResponse.loginInfo.accessToken
    ];
    await appPreferences.setAuthInfos(id, infos);

    loadAuthInfo(id);
    loadAllAuthInfos();
  }

  @override
  Future loadAuthInfo(String key) async {
    final authInfos = await appPreferences.getAuthInfos(key);
    // first one is name and second one is accessToken - key / stringlist
    userFullNameNotifier.value = key;
    userFullNameNotifier.value = authInfos[0];
    accessTokenNotifier.value = authInfos[1];
  }

  @override
  Future loadAllAuthInfos() async {
    final loggedInStudents = await appPreferences.getAllAuthInfos();
    loggedInUsersNotifier.value = loggedInStudents;
    userKeyNotifier.value = loggedInStudents[0].key;
    userFullNameNotifier.value = loggedInStudents[0].name;
    accessTokenNotifier.value = loggedInStudents[0].accessToken;
  }
}
