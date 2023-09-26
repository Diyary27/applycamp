abstract class StudentAuthRepository {
  Future register(
      {required String fullName,
      required String email,
      required String password,
      required String gender,
      required String phone});
  Future login(String email, String password);
  Future sendForgotPassEmail(String email);
  Future logout();
  Future loadAuth();
}
