class PortalRemoteConstants {
  static const String baseUrl = "https://fhzapi.sedevs.com";

  // Authentication
  // minimal registeration is only for students
  static const String minimalRegisteration =
      "/api/v1/student-panel/minimal-register";
  static const String agentRegisteration = "/api/v1/auth/register";
  static const String studentLogin = "/api/v1/student-panel/login";
  static const String agentLogin = "/api/v1/auth/login";
  static const String sendForgotPasswordEmail =
      "/api/v1/student-panel/send-forgot-password-email";

  // Search Programs
  static const String getProgramSearchFields =
      "/landing/school-programs/search/get-fields";
  static const String searchPrograms =
      "/landing/school-programs/search?list=paginate&";

  static const String getStudyFields = "/api/v1/content-items/study-fields";
  static const String getAllCities = "/api/v1/content-items/cities";
  static const String getAllStudyFields = "/api/v1/content-items/study-fields";
}
