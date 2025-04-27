// lib/data/repositories/auth_repo.dart

import '../../core/helper_response.dart';
import '../../core/enums.dart';

/// تحدد هذا الواجهة الدوال التي سيتوجب على أي كلاس
/// مسؤول عن المصادقة (Auth) أن يوفّرها.
abstract class AuthRepo {
  Future<HelperResponse> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String phone,
  });

  Future<HelperResponse> logIn({
    required String email,
    required String password,
  });
}
