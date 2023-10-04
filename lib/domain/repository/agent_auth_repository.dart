abstract class AgentAuthRepository {
  Future register(
      {required String email,
      required String password,
      required String name,
      required String organization,
      required String phone});
  Future login(String email, String password);
  Future sendForgotPassEmail(String email);
  Future logout(String key);
  Future loadAllAuthInfos();
  Future loadAuthInfo(String key);
  Future getProfile();
  Future editProfile(String name, String organization, String phone,
      String? password, Map? profileImage);
}
