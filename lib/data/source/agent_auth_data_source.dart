abstract class AgentAuthDataSource {
  Future register(String email, String password, String name,
      String organization, String phone);
  Future login(String email, String password);
  Future sendForgotPassEmail(String email);
  Future logout();
  Future loadAuth();
}

class AgentAuthDataSourceImpl implements AgentAuthDataSource {
  @override
  Future loadAuth() {
    // TODO: implement loadAuth
    throw UnimplementedError();
  }

  @override
  Future login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future register(String email, String password, String name,
      String organization, String phone) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future sendForgotPassEmail(String email) {
    // TODO: implement sendForgotPassEmail
    throw UnimplementedError();
  }
}
