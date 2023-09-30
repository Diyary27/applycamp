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
  Future login(String email, String password) async {
    final authResponse = await dataSource.login(email, password);

    await persistAuth(authResponse);
    return authResponse;
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
  Future logout(String key) async {
    userKeyNotifier.value = null;
    accessTokenNotifier.value = null;
    userFullNameNotifier.value = null;
    await appPreferences.clearUserAuthInfo(key);
    loadAllAuthInfos();
  }

  Future persistAuth(UserAuthResponse authResponse) async {
    final id = authResponse.user.id.toString();
    final infos = [authResponse.user.name, authResponse.loginInfo.accessToken];
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
    final loggedInUsers = await appPreferences.getAllAuthInfos();
    loggedInUsersNotifier.value = loggedInUsers;
    userKeyNotifier.value = loggedInUsers[0].key;
    userFullNameNotifier.value = loggedInUsers[0].name;
    accessTokenNotifier.value = loggedInUsers[0].accessToken;
  }

  @override
  Future sendForgotPassEmail(String email) {
    // TODO: implement sendForgotPassEmail
    throw UnimplementedError();
  }

  @override
  Future editProfile() {
    // TODO: implement editProfile
    throw UnimplementedError();
  }

  @override
  Future getProfile() async {
    return await dataSource.getProfile();
  }
}
