import 'dart:io';

class ApiConfig {
  // static String baseUrl = 'http://10.42.0.1:8000';
  //   Platform.isAndroid ? 'http://10.0.2.2:8000/' : 'http://10.42.0.255:8000';
  static String baseUrl =
      Platform.isAndroid ? 'http://10.0.2.2:8000/' : 'http://127.0.0.1:8000';
  static const String loginEndpoint = 'api/v1/login';
  static const String getProfile = 'api/v1/profile';
  static const String sendVerificationCode = 'api/v1/send_verification_code';
  static const String verifyCode = 'api/v1/verify_code';
  static const String resetPassword = 'api/v1/reset_password';
  static const String getAllRequests = 'api/v1/get_all_Request';
  static const String acceptRequest = 'api/v1/accept_Request';
  static const String rejectRequest = 'api/v1/reject_Request';
  static const String homeEndpoint = 'api/v1/get_all_Request';
  static const String getFrequentlyQuestions = 'api/v1/get_FrequentlyQuestions';
  static const String getCheckPropertyById = 'api/v1/get_properties_by_id';
  static const String getCheckDocumentById =
      'api/v1/get_image_for_property_by_id';
  static const String addImageForDocument = 'api/v1/add_image_for_Document/';
  static const String getBuyRequestCompleted =
      'api/v1/get_buy_request_completed';
  static const String getAllDeputizationsForLawyer =
      'api/v1/get_all_deputizations_for_lawyer';
  static const String processDeputizationsByLawyer =
      'api/v1/process_deputizations_by_lawyer';
  static const String getAllOwnershipRequestsForlawyer =
      'api/v1/get_all_ownership_requests_for_lawyer';
}
