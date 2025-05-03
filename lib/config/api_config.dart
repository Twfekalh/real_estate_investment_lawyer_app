import 'dart:io';

class ApiConfig {
  static String baseUrl =
      Platform.isAndroid ? 'http://10.0.2.2:8000/' : 'http://127.0.0.1:8000';

  // static const int timeout = 30;
  static const String loginEndpoint = 'api/login';

  static const String userEndpoint = 'api/profile';

  static const String sendVerificationCode = 'api/send_verification_code';
  static const String verifyCode = 'api/verify_code';
  static const String resetPassword = 'api/reset_password';
}
