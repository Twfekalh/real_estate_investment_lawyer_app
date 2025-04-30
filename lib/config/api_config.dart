class ApiConfig {
  static const String baseUrl = 'http://127.0.0.1:8000';

  static const int timeout = 30;
  static const String loginEndpoint = 'api/login';

  static const String userEndpoint = 'api/profile';

  static const String sendVerificationCode = 'api/send_verification_code';
  static const String verifyCode = 'api/verify_code';
  static const String resetPassword = 'api/reset_password';
}
