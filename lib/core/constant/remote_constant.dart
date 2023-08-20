class RemoteConstant {
  static const String baseUrl = 'https://fhzapi.sedevs.com/api';

  //Authentication
  static const String register = '/v1/auth/register';
  static const String login = '/v1/auth/login';
  static const String loggedinInfo = '/v1/auth/me';
  static const String sendForgotPassword =
      '/v1/auth/send-forgot-password-email';
  static const String resetPassword = '/v1/auth/reset-password';
}
