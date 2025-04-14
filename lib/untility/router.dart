import 'package:go_router/go_router.dart';
import 'package:lawyer_app/presentation/auth/forgot_password_view.dart';
import 'package:lawyer_app/presentation/auth/reset_password_view.dart';
import 'package:lawyer_app/presentation/auth/signup_view.dart';
import 'package:lawyer_app/presentation/check%20property/check_property_view.dart';
import 'package:lawyer_app/presentation/check/check_view.dart';
import 'package:lawyer_app/presentation/help/help_view.dart';
import 'package:lawyer_app/presentation/home%20page/home_page_view.dart';
import 'package:lawyer_app/presentation/profile/profile_view.dart';

abstract class AppRouter {
  static const kHomePageView = '/homePageView';
  static const kSignupView = '/signupView';
  static const kResetPasswordView = '/resetPasswordView';
  static const kForgotPasswordView = '/forgotPasswordView';
  static const kProfileView = '/profileView';
  static const kHelpView = '/helpView';
  static const kCheckView = '/CheckView';
  static const kCheckPropertyView = '/CheckPropertyView';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomePageView()),
      GoRoute(
        path: kHomePageView,
        builder: (context, state) => const HomePageView(),
      ),
      GoRoute(
        path: kSignupView,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(path: kCheckView, builder: (context, state) => const CheckView()),
      GoRoute(
        path: kCheckPropertyView,
        builder: (context, state) => const CheckPropertyView(),
      ),
      GoRoute(
        path: kResetPasswordView,
        builder: (context, state) => const ResetPasswordView(),
      ),
      GoRoute(
        path: kForgotPasswordView,
        builder: (context, state) => const ForgetPasswordView(),
      ),
      GoRoute(
        path: kProfileView,
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(path: kHelpView, builder: (context, state) => const HelpView()),
    ],
  );
}
