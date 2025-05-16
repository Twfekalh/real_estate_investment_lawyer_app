import 'dart:io';

class ApiConfig {
  static String baseUrl =
      Platform.isAndroid ? 'http://10.0.2.2:8000/' : 'http://127.0.0.1:8000';

  // static const int timeout = 30;
  static const String loginEndpoint = 'api/login';

  static const String getProfile = 'api/profile';

  static const String sendVerificationCode = 'api/send_verification_code';
  static const String verifyCode = 'api/verify_code';
  static const String resetPassword = 'api/reset_password';
  static const String getAllRequests = 'api/get_all_Request';
  static const String acceptRequest = 'api/accept_Request/1';
  static const String rejectRequest = 'api/reject_Request';
  static const String homeEndpoint = 'api/get_all_Request';
  static const String getFrequentlyQuestions = 'api/get_FrequentlyQuestions';
}
