class ApiConfig {
  static const String baseUrl = 'http://127.0.0.1:8000/api/';

  static const int timeout = 30;
  static const String loginEndpoint = 'auth/login';

  static const String userEndpoint = 'user/profile';

  static const String sendVerificationCode = 'auth/send_verification_code';
  static const String verifyCode = 'auth/verify_code';
  static const String resetPassword = 'auth/reset_password';
}
