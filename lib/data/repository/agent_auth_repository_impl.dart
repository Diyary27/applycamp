import 'package:applycamp/data/local/app_preferences.dart';
import 'package:applycamp/data/model/user_model/user.dart';
import 'package:applycamp/data/model/user_model/user_auth_response.dart';
import 'package:applycamp/data/source/agent_auth_data_source.dart';
import 'package:applycamp/di/service_locator.dart';
import 'package:applycamp/domain/entity/auth_data.dart';
import 'package:applycamp/domain/entity/profile_fields.dart';
import 'package:applycamp/domain/repository/agent_auth_repository.dart';

class AgentAuthRepositoryImpl implements AgentAuthRepository {
  final AgentAuthDataSource dataSource;
  final AppPreferences appPreferences;

  AgentAuthRepositoryImpl(this.dataSource, this.appPreferences);

  @override
  Future login(String email, String password) async {
    final authResponse = await dataSource.login(email, password);

    await persistAuth(authResponse);
    // موقت
    await appPreferences.setLoginInfo(authResponse.user.id.toString(), [
      authResponse.user.email,
      password,
      authResponse.user.roleId.toString(),
      authResponse.user.profileImage?.path != null
          ? authResponse.user.profileImage!.path
          : '',
    ]);

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
    loggedInUserNotifier.value = AuthData();
    await appPreferences.clearUserAuthInfo(key);
    loadAllAuthInfos();
  }

  Future persistAuth(UserAuthResponse authResponse) async {
    final id = authResponse.user.id.toString();
    final infos = [
      authResponse.user.name,
      authResponse.loginInfo.accessToken,
      // agents have role id
      authResponse.user.roleId.toString(),
      authResponse.user.profileImage?.path != null
          ? authResponse.user.profileImage!.path
          : '',
    ];
    await appPreferences.setAuthInfos(id, infos);

    loadAuthInfo(id);
    loadAllAuthInfos();
  }

  @override
  Future loadAuthInfo(String key) async {
    // ex. key : "auth_{id}""
    // we want to remove the keyword auth and pass id
    final id = key.replaceAll("auth_", '');
    final authInfos = await appPreferences.getAuthInfos(id);

    if (authInfos != null) {
      loggedInUserNotifier.value = AuthData(
        key: key,
        name: authInfos[0],
        accessToken: authInfos[1],
        userRoleId: int.tryParse(authInfos[2]),
        profileImagePath: authInfos[3],
      );
    }
  }

  @override
  Future loadAllAuthInfos() async {
    final loggedInUsers = await appPreferences.getAllAuthInfos();
    AllloggedInUsersNotifier.value = loggedInUsers;

    loggedInUserNotifier.value = AuthData();
    if (loggedInUsers.isNotEmpty) {
      loggedInUserNotifier.value = AuthData(
        key: loggedInUsers[0].key,
        name: loggedInUsers[0].name,
        accessToken: loggedInUsers[0].accessToken,
        userRoleId: loggedInUsers[0].userRoleId,
        profileImagePath: loggedInUsers[0].profileImagePath,
      );
    }
  }

  @override
  Future sendForgotPassEmail(String email) {
    // TODO: implement sendForgotPassEmail
    throw UnimplementedError();
  }

  @override
  Future getProfile() async {
    return await dataSource.getProfile();
  }

  @override
  Future editProfile(ProfileFields profileFields) async {
    final response = await dataSource.editProfile(profileFields);

    // اینجا باید از حافظه داحلی هم اطلاعات رو اپدیت کرد
    final User profile = await getProfile();
    final loginInfo = await appPreferences.getLoginInfo(profile.id.toString());
    login(loginInfo[0], loginInfo[1]);

    loadAllAuthInfos();
    return response;
  }
}
