import 'package:applycamp/data/local/app_preferences.dart';
import 'package:applycamp/data/model/student_model/student_auth_response.dart';
import 'package:applycamp/data/source/student_auth_data_source.dart';
import 'package:applycamp/di/service_locator.dart';
import 'package:applycamp/domain/entity/auth_data.dart';
import 'package:applycamp/domain/repository/student_auth_repository.dart';

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
    loggedInUserNotifier.value = AuthData();
    await appPreferences.clearUserAuthInfo(key);
    loadAllAuthInfos();
  }

  Future persistAuth(StudentAuthResponse authResponse) async {
    final id = authResponse.student.id.toString();
    final infos = [
      authResponse.student.name!,
      authResponse.loginInfo.accessToken
    ];
    await appPreferences.setAuthInfos(id, infos);

    loadAuthInfo(id);
    loadAllAuthInfos();
  }

  @override
  Future loadAuthInfo(String key) async {
    final authInfos = await appPreferences.getAuthInfos(key);

    loggedInUserNotifier.value =
        AuthData(key: key, name: authInfos[0], accessToken: authInfos[1]);
  }

  @override
  Future loadAllAuthInfos() async {
    final loggedInStudents = await appPreferences.getAllAuthInfos();
    AllloggedInUsersNotifier.value = loggedInStudents;

    if (loggedInStudents.isNotEmpty) {
      loggedInUserNotifier.value = AuthData(
          key: loggedInStudents[0].key,
          name: loggedInStudents[0].name,
          accessToken: loggedInStudents[0].accessToken);
    }
  }
}
