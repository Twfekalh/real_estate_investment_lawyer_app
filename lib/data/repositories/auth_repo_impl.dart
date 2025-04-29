import '../../core/api_service.dart';
import '../../core/helper_response.dart';
import '../../config/api_config.dart';
import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService _api;

  AuthRepoImpl(this._api);

  @override
  Future<HelperResponse> logIn({
    required String email,
    required String password,
  }) {
    return _api.post(
      endpoint: ApiConfig.loginEndpoint,
      data: {'email': email, 'password': password},
    );
  }

  @override
  Future<HelperResponse> sendVerificationCode({required String email}) {
    return _api.post(
      endpoint: ApiConfig.sendVerificationCode,
      data: {'email': email},
    );
  }

  @override
  Future<HelperResponse> verifyCode({
    required String email,
    required String code,
  }) {
    return _api.post(
      endpoint: ApiConfig.verifyCode,
      data: {'email': email, 'verification_code': code},
    );
  }

  @override
  Future<HelperResponse> resetPassword({
    required String email,
    required String password,
    required String passwordConfirmation,
  }) {
    return _api.post(
      endpoint: ApiConfig.resetPassword,
      data: {
        'email': email,
        'password': password,
        'password_confirmation': passwordConfirmation,
      },
    );
  }
}
