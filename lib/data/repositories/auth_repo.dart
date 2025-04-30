import 'package:lawyer_app/presentation/auth/bloc/user_bloc.dart';

abstract class AuthRepo {
  Future logIn(LogInEvent event);
  Future sendVerificationCode(SendVerificationCodeEvent event);
  Future resetPassword(ResetPasswordEvent event);
  Future verifyCode(VerifyCodeEvent event);
}
