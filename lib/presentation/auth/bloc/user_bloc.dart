import 'package:flutter_bloc/flutter_bloc.dart' show Bloc;
import 'package:lawyer_app/core/api_service.dart';
import 'package:lawyer_app/data/models/login_response.dart';
import 'package:lawyer_app/data/repositories/auth_repo_impl.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final AuthRepoImpl authRepoImpl;
  UserBloc(this.authRepoImpl) : super(UserInitial()) {
    on<LogInEvent>((event, emit) async {
      emit(UserLoading());
      final response = await authRepoImpl.logIn(event);

      if (response is LogInResponse) {
        emit(UserLoginState(user: response));
        print('hiii');
        print(response.token);
      } else {
        emit(UserErrorState(helperResponse: response));
      }
    });
    on<ResetPasswordEvent>((event, emit) async {
      emit(UserLoading());
      final response = await authRepoImpl.resetPassword(event);

      if (response is String) {
        print('hjjj lll');
        emit(ResetSuccessState(message: response));
      } else {
        emit(UserErrorState(helperResponse: response));
      }
    });

    on<SendVerificationCodeEvent>((event, emit) async {
      emit(UserLoading());
      final response = await authRepoImpl.sendVerificationCode(event);

      if (response is String) {
        emit(SendVerificationSuccessState(message: response));
      } else {
        emit(UserErrorState(helperResponse: response));
      }
    });

    on<VerifyCodeEvent>((event, emit) async {
      emit(UserLoading());
      final response = await authRepoImpl.verifyCode(event);

      if (response is String) {
        emit(VerifiySuccessState(message: response));
      } else {
        emit(UserErrorState(helperResponse: response));
      }
    });
  }
}
