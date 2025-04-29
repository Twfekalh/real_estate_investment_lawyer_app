import '../../core/helper_response.dart';

abstract class AuthRepo {
  Future<HelperResponse> logIn({
    required String email,
    required String password,
  });

  Future<HelperResponse> sendVerificationCode({required String email});

  Future<HelperResponse> verifyCode({
    required String email,
    required String code,
  });

  Future<HelperResponse> resetPassword({
    required String email,
    required String password,
    required String passwordConfirmation,
  });
}
