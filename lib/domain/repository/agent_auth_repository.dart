abstract class AgentAuthRepository {
  Future register(
      {required String email,
      required String password,
      required String name,
      required String organization,
      required String phone});
  Future login(String email, String password);
  Future sendForgotPassEmail(String email);
  Future logout();
  Future loadAuth();
  Future getProfile();
  Future editProfile();
}
