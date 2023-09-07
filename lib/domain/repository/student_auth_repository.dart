abstract class StudentAuthRepository {
  Future register(String fullName, String email, String password, String gender,
      String phone);
  Future login(String email, String password);
  Future sendForgotPassEmail(String email);
  Future logout();
  Future loadAuth();
}
