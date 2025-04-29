import 'package:go_router/go_router.dart';
import 'package:lawyer_app/presentation/auth/login_view.dart';
import 'package:lawyer_app/presentation/buy/buy_view.dart';
import 'package:lawyer_app/presentation/auth/forgot_password_view.dart';
import 'package:lawyer_app/presentation/auth/reset_password_view.dart';
import 'package:lawyer_app/presentation/auth/signup_view.dart';
import 'package:lawyer_app/presentation/check%20document/check_documents.dart';
import 'package:lawyer_app/presentation/check%20property/check_property_view.dart';
import 'package:lawyer_app/presentation/check/check_view.dart';
import 'package:lawyer_app/presentation/check/widgets/refuse_reason_bottom_sheet.dart';
import 'package:lawyer_app/presentation/help/help_view.dart';
import 'package:lawyer_app/presentation/help/widgets/common_question.dart';
import 'package:lawyer_app/presentation/home%20page/home_page_view.dart';
import 'package:lawyer_app/presentation/home%20page/widget/complated_page_view.dart';
import 'package:lawyer_app/presentation/profile/profile_view.dart';

abstract class AppRouter {
  static const kHomePageView = '/homePageView';
  // static const kSignupView = '/signupView';
  static const kResetPasswordView = '/resetPasswordView';
  static const kForgotPasswordView = '/forgotPasswordView';
  static const kProfileView = '/ProfileView';
  static const kHelpView = '/helpView';
  static const kCheckView = '/CheckView';
  static const kCheckPropertyView = '/CheckPropertyView';
  static const kRefuseReasonBottomSheet = '/RefuseReasonBottomSheet';
  static const kCheckDocumentView = '/CheckDocumentView';
  static const kCommonQuestion = '/CommonQuestion';
  static const kBayView = '/BayView';
  static const kComplatedPageView = '/ComplatedPageView';
  static const kLoginView = '/LoginView';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomePageView()),
      GoRoute(
        path: kHomePageView,
        builder: (context, state) => const HomePageView(),
      ),
      // GoRoute(
      //   path: kSignupView,
      //   builder: (context, state) => const SignUpView(),
      // ),
      GoRoute(path: kLoginView, builder: (context, state) => const LoginView()),
      GoRoute(
        path: kComplatedPageView,
        builder: (context, state) => const ComplatedPageView(),
      ),
      GoRoute(
        path: kRefuseReasonBottomSheet,
        builder: (context, state) => const RefuseReasonBottomSheet(),
      ),
      GoRoute(path: kBayView, builder: (context, state) => const BayView()),
      GoRoute(path: kCheckView, builder: (context, state) => const CheckView()),
      GoRoute(
        path: kCheckPropertyView,
        builder: (context, state) => const CheckPropertyView(),
      ),
      GoRoute(
        path: kCheckDocumentView,
        builder: (context, state) => CheckDocumentView(),
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
      GoRoute(
        path: kCommonQuestion,
        builder: (context, state) => const CommonQuestion(),
      ),
    ],
  );
}
