import 'package:lawyer_app/config/api_config.dart';
import 'package:lawyer_app/core/api_service.dart';
import 'package:lawyer_app/core/enums.dart';
import 'package:lawyer_app/core/handle_cash.dart';
import 'package:lawyer_app/data/models/login_response.dart';
import 'package:lawyer_app/data/repositories/auth_repo.dart';
import 'package:lawyer_app/presentation/auth/bloc/user_bloc.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService _apiService;

  AuthRepoImpl(this._apiService);
  @override
  Future logIn(LogInEvent event) async {
    HelperResponse helperResponse = await _apiService.post(
      endpoint: ApiConfig.loginEndpoint,
      data: {'email': event.email, 'password': event.password},
    );
    //  print(helperResponse.servicesResponse);
    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        LogInResponse logInResponse = LogInResponse.from(
          helperResponse.fullBody!,
        );
        print('Full response: ${helperResponse.fullBody}');
        print(logInResponse);
        print('hiii22');
        print(logInResponse.message);
        await setCache(logInResponse);
        return logInResponse;
      } catch (e) {
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }

    return helperResponse;
  }

  @override
  Future resetPassword(ResetPasswordEvent event) async {
    HelperResponse helperResponse = await _apiService.post(
      endpoint: ApiConfig.resetPassword,
      data: {
        'email': event.email,
        'password': event.password,
        'password_confirmation': event.passWordConfirm,
      },
    );
    //  print(helperResponse.servicesResponse);
    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        final responseBody = helperResponse.fullBody;
        return responseBody?['message'];
      } catch (e) {
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }

    return helperResponse;
  }

  @override
  Future sendVerificationCode(SendVerificationCodeEvent event) async {
    HelperResponse helperResponse = await _apiService.post(
      endpoint: ApiConfig.sendVerificationCode,
      data: {'email': event.email},
    );
    //  print(helperResponse.servicesResponse);
    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        final responseBody = helperResponse.fullBody;
        return responseBody?['message'];
      } catch (e) {
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }

    return helperResponse;
  }

  @override
  Future verifyCode(VerifyCodeEvent event) async {
    HelperResponse helperResponse = await _apiService.post(
      endpoint: ApiConfig.verifyCode,
      data: {'email': event.email, 'verification_code': event.code},
    );
    //  print(helperResponse.servicesResponse);
    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        final responseBody = helperResponse.fullBody;
        return responseBody?['message'];
      } catch (e) {
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }

    return helperResponse;
  }
}
