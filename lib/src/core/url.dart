class Url {
  static String baseUrl =
      // 'https://wallace-telephony-web-assignment.trycloudflare.com';
      'https://offers-helped-plan-korean.trycloudflare.com';
  // 'http://18.206.215.68';

  static String login = 'auth/login';

  //getCourses
  static String getNewcourses = 'courses/';
  static String getMyCourses = 'courses/my';

  //registration
  static String registeration = 'auth/register';
  static String verifyregistration = 'auth/verify-otp';

  //forgotpassword
  static String forgotpasswordreq = 'auth/forgot-password';
  static String resetpasswordreq = 'auth/reset-password';

  static String refresh = "user/refresh";

  static String questions = "test/questions";
  static String submit = "test/submit";

  static String dashboard = "analytics/dashboard";

  static String enrollCourse(String courseId) {
    return 'courses/$courseId/enroll';
  }
}
