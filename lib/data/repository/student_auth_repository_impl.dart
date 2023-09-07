import 'package:applycamp/data/local/app_preferences.dart';
import 'package:applycamp/data/model/student_model/student_auth_response.dart';
import 'package:applycamp/data/source/student_auth_data_source.dart';
import 'package:applycamp/di/service_locator.dart';
import 'package:applycamp/domain/repository/student_auth_repository.dart';
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
  Future register(String fullName, String email, String password, String gender,
      String phone) async {
    final authResponse =
        await dataSource.register(fullName, email, password, gender, phone);

    await persistAuth(authResponse);
    return authResponse;
  }

  @override
  Future sendForgotPassEmail(String email) async =>
      await dataSource.sendForgotPassEmail(email);

  @override
  Future logout() async {
    accessTokenNotifier.value = null;
    userFullNameNotifier.value = null;
    await appPreferences.clear();
  }

  Future persistAuth(StudentAuthResponse authResponse) async {
    await appPreferences.saveAccessToken(authResponse.loginInfo.accessToken);
    await appPreferences.setFullName(authResponse.student.fullName);
    loadAuth();
  }

  @override
  Future loadAuth() async {
    final accessToken = await appPreferences.loadAccessToken();
    final fullName = await appPreferences.getFullName();
    accessTokenNotifier.value = accessToken;
    userFullNameNotifier.value = fullName;
  }
}
