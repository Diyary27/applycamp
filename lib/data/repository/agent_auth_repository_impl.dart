import 'package:applycamp/data/local/app_preferences.dart';
import 'package:applycamp/data/model/user_model/user_auth_response.dart';
import 'package:applycamp/data/source/agent_auth_data_source.dart';
import 'package:applycamp/di/service_locator.dart';
import 'package:applycamp/domain/repository/agent_auth_repository.dart';

class AgentAuthRepositoryImpl implements AgentAuthRepository {
  final AgentAuthDataSource dataSource;
  final AppPreferences appPreferences;

  AgentAuthRepositoryImpl(this.dataSource, this.appPreferences);

  @override
  Future loadAuth() async {
    final accessToken = await appPreferences.loadAccessToken();
    final fullName = await appPreferences.getFullName();
    accessTokenNotifier.value = accessToken;
    userFullNameNotifier.value = fullName;
  }

  @override
  Future login(String email, String password) async {
    final authResponse = await dataSource.login(email, password);

    await persistAuth(authResponse);
    return authResponse;
  }

  @override
  Future logout() async {
    accessTokenNotifier.value = null;
    userFullNameNotifier.value = null;
    await appPreferences.clear();
  }

  @override
  Future register(
      {required String email,
      required String password,
      required String name,
      required String organization,
      required String phone}) async {
    final authResponse = await dataSource.register(
        email: email,
        password: password,
        name: name,
        organization: organization,
        phone: phone);

    await persistAuth(authResponse);
    return authResponse;
  }

  @override
  Future sendForgotPassEmail(String email) {
    // TODO: implement sendForgotPassEmail
    throw UnimplementedError();
  }

  Future persistAuth(UserAuthResponse authResponse) async {
    await appPreferences.saveAccessToken(authResponse.loginInfo.accessToken);
    await appPreferences.setFullName(authResponse.user.name);
    loadAuth();
  }
}
