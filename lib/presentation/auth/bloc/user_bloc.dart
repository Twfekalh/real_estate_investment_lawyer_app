import 'package:bloc/bloc.dart';
import 'package:lawyer_app/core/enums.dart';
import 'package:lawyer_app/core/helper_response.dart';
import 'package:lawyer_app/data/models/login_response.dart';
import 'package:lawyer_app/data/repositories/auth_repo_impl.dart';
import 'package:lawyer_app/untility/cache_helper.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final AuthRepoImpl authRepoImpl;

  UserBloc(this.authRepoImpl) : super(UserInitial()) {
    on<LogInEvent>(_onLogIn);
    on<ResetPasswordEvent>(_onResetPassword);
    on<SendVerificationCodeEvent>(_onSendVerificationCode);
    on<VerifyCodeEvent>(_onVerifyCode);
  }

  Future<void> _onLogIn(LogInEvent event, Emitter<UserState> emit) async {
    emit(UserLoading());
    final resp = await authRepoImpl.logIn(
      email: event.email,
      password: event.password,
    );

    if (resp.servicesResponse == ServicesResponseStatues.success &&
        resp.fullBody != null) {
      try {
        final loginModel = LoginResponse.fromJson(resp.fullBody!);
        await CacheHelper.setData(key: 'token', value: loginModel.token);
        emit(UserLoginState(user: loginModel));
      } catch (_) {
        emit(
          UserErrorState(
            helperResponse: resp.copyWith(
              servicesResponse: ServicesResponseStatues.someThingWrong,
              response: 'Parsing error',
            ),
          ),
        );
      }
    } else {
      emit(UserErrorState(helperResponse: resp));
    }
  }

  Future<void> _onResetPassword(
    ResetPasswordEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(UserLoading());
    final resp = await authRepoImpl.resetPassword(
      email: event.email,
      password: event.password,
      passwordConfirmation: event.passWordConfirm,
    );

    if (resp.servicesResponse == ServicesResponseStatues.success) {
      final msg = resp.fullBody?['message'] as String? ?? 'Success';
      emit(ResetSuccessState(message: msg));
    } else {
      emit(UserErrorState(helperResponse: resp));
    }
  }

  Future<void> _onSendVerificationCode(
    SendVerificationCodeEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(UserLoading());
    final resp = await authRepoImpl.sendVerificationCode(email: event.email);

    if (resp.servicesResponse == ServicesResponseStatues.success) {
      final msg = resp.fullBody?['message'] as String? ?? 'Code sent';
      emit(SendVerificationSuccessState(message: msg));
    } else {
      emit(UserErrorState(helperResponse: resp));
    }
  }

  Future<void> _onVerifyCode(
    VerifyCodeEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(UserLoading());
    final resp = await authRepoImpl.verifyCode(
      email: event.email,
      code: event.code,
    );

    if (resp.servicesResponse == ServicesResponseStatues.success) {
      final msg = resp.fullBody?['message'] as String? ?? 'Verified';
      emit(VerifiySuccessState(message: msg));
    } else {
      emit(UserErrorState(helperResponse: resp));
    }
  }
}
