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
  static const String userProfile = "/api/v1/auth/me";
  static const String editProfile = "/api/v1/user/edit-profile";

  // user
  static const String dashboard = "/api/v1/user/dashboard";
  static const String uploadProfileImage = "/api/v1/user/upload-profile-image";

  // subUsers
  static const String getAllSubUsers = "/api/v1/user/sub-users";
  static const String createSubUser = "/api/v1/user/sub-user/create?";
  //// for delete  /api/v1/user/sub-user/{id}
  static const String deleteSubUser = "/api/v1/user/sub-user/";

  // students
  static const String getLoggedInUserStudents = "/api/v1/user/my-students";
  //// here we will concat the id to it
  static const String getStudentById = "/api/v1/student/";
  static const String getFieldsToModifyStudent =
      "/api/v1/student/get-fields-to-modify";
  static const String getStudentDocumentTypes =
      "/api/v1/student/document-types";
  static const String uploadStudentPhoto = "/api/v1/student/upload-image";
  ////  it should be like that /api/v1/student/document-type/3/upload
  static const String uploadDocument = "/api/v1/student/document-type/";
  static const String createStudent = "/api/v1/student/create";

  // applications
  static const String getMyApplications = "/api/v1/my-applications";
  static const String getAllApplicationStatus = "/api/v1/applications/statuses";
  //// here we will concat the id to it
  static const String getAnApplication = "/api/v1/application/";
  static const String getCreateApplicationFields =
      "/api/v1/application/get-fields";
  //// api/v1/application/add?studentId=212
  static const String createApplication = "/api/v1/application/add?";

  // programs
  static const String getPrograms = "/api/v1/programs";
  // // "/api/v1/content-items/study-fields/36/programs"
  static const String getProgramsByStudyField =
      "/api/v1/content-items/study-fields/";

  // Search Programs
  static const String getProgramSearchFields =
      "/landing/school-programs/search/get-fields";
  static const String searchPrograms =
      "/landing/school-programs/search?list=paginate&";

  static const String getStudyFields = "/api/v1/content-items/study-fields";
  static const String getAllCities = "/api/v1/content-items/cities";
  static const String getAllStudyFields = "/api/v1/content-items/study-fields";
  static const String getSchoolsNormalUser = "/api/v1/schools/normal-users";

  // // /api/v1/content-items/cities/1/schools
  static const String getSchoolsByCity = "/api/v1/content-items/cities/";

  // schools
  static const String getSchoolById = "/api/v1/school/";
}
