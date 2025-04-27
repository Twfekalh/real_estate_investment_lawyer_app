// lib/data/repositories/auth_repo_impl.dart

import '../../core/api_service.dart';
import '../../core/helper_response.dart';
import '../../core/enums.dart';
import '../../config/api_config.dart';
import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService _api;

  AuthRepoImpl(this._api);

  @override
  Future<HelperResponse> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String phone,
  }) {
    return _api.post(
      endpoint: ApiConfig.registerEndpoint,
      data: {
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': passwordConfirmation,
        'phone': phone,
      },
    );
  }

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
}
