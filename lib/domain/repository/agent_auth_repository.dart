abstract class AgentAuthRepository {
  Future register(String email, String password, String name,
      String organization, String phone);
  Future login(String email, String password);
  Future sendForgotPassEmail(String email);
  Future logout();
  Future loadAuth();
}
