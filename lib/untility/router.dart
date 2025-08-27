import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lawyer_app/core/constant.dart';
import 'package:lawyer_app/core/service_locator.dart';
import 'package:lawyer_app/presentation/auth/login_view.dart';
import 'package:lawyer_app/presentation/buy/presentation/buy_view.dart';
import 'package:lawyer_app/presentation/auth/forgot_password_view.dart';
import 'package:lawyer_app/presentation/auth/reset_password_view.dart';
import 'package:lawyer_app/presentation/check%20document/check_documents.dart';
import 'package:lawyer_app/presentation/check%20document/data/model/check/data.document.dart';
import 'package:lawyer_app/presentation/check%20document/data/repo/check_document_repo_impl.dart';
import 'package:lawyer_app/presentation/check%20document/presentation/bloc/check_document_bloc.dart';
import 'package:lawyer_app/presentation/check%20property/check_property_view.dart';
import 'package:lawyer_app/presentation/check%20property/data/repo/check_property_repo_impl.dart';
import 'package:lawyer_app/presentation/check%20property/presentation/bloc/check_proparty_bloc.dart';
import 'package:lawyer_app/presentation/check/check_view.dart';
import 'package:lawyer_app/presentation/check/presentation/widgets/refuse_reason_bottom_sheet.dart';
import 'package:lawyer_app/presentation/deputization/data/repo/deputizations_repo_impl.dart';
import 'package:lawyer_app/presentation/deputization/presentation/bloc/deputizations_bloc.dart';
import 'package:lawyer_app/presentation/deputization/presentation/deputizations_view.dart';
import 'package:lawyer_app/presentation/help/help_view.dart';
import 'package:lawyer_app/presentation/help/presentation/widgets/common_question.dart';
import 'package:lawyer_app/presentation/home%20page/data/model/home/buy_request.page.model.dart';
import 'package:lawyer_app/presentation/home%20page/data/model/home/legal_check.page.model.dart';
import 'package:lawyer_app/presentation/home%20page/home_page_view.dart';
import 'package:lawyer_app/presentation/home%20page/presentation/widget/complated_page_view.dart';
import 'package:lawyer_app/presentation/profile/profile_view.dart';
import 'package:lawyer_app/presentation/ownership requests for lawyer/presentation/ownership_requests_view.dart';
import 'package:lawyer_app/presentation/ownership requests for lawyer/presentation/bloc/owner_ship_requests_bloc.dart';
import 'package:lawyer_app/presentation/ownership requests for lawyer/data/repo/owner_ship_requests_repo_impl.dart';

abstract class AppRouter {
  static const kHomePageView = '/homePageView';
  static const kResetPasswordView = '/resetPasswordView';
  static const kForgotPasswordView = '/forgotPasswordView';
  static const kProfileView = '/ProfileView';
  static const kHelpView = '/helpView';
  static const kCheckView = '/CheckView';
  static const kCheckPropertyView = '/CheckPropertyView';
  static const kRefuseReasonBottomSheet = '/RefuseReasonBottomSheet';
  static const kCheckDocumentView = '/CheckDocumentView';
  static const kCommonQuestion = '/CommonQuestion';
  static const kBuyView = '/BuyView';
  static const kComplatedPageView = '/ComplatedPageView';
  static const kDeputizationsView = '/DeputizationsView';
  static const kLoginView = '/LoginView';
  static const kOwnershipRequestsView = '/OwnershipRequestsView';

  static final router = GoRouter(
    routes: [
      //   if (token != null && token!.isNotEmpty)
      //     GoRoute(path: '/', builder: (context, state) => const HomePageView()),
      //   if (token!.isEmpty)
      GoRoute(path: '/', builder: (context, state) => const HomePageView()),
      GoRoute(path: kLoginView, builder: (context, state) => const LoginView()),
      GoRoute(
        path: kHomePageView,
        builder: (context, state) => const HomePageView(),
      ),
      GoRoute(
        path: kDeputizationsView,
        builder: (context, state) => const DeputizationsView(),
      ),
      GoRoute(
        path: kOwnershipRequestsView,
        builder:
            (context, state) => BlocProvider(
              create:
                  (_) => OwnerShipRequestsBloc(
                    getIt.get<OwnerShipRequestsRepoImpl>(),
                  ),
              child: const OwnershipRequestsView(),
            ),
      ),

      // GoRoute(
      //   path: kDeputizationsView,
      //   builder:
      //       (context, state) => BlocProvider(
      //         create:
      //             (context) =>
      //                 DeputizationsBloc(getIt.get<DeputizationsRepoImpl>())
      //                   ..add(GetDeputizationsEvent()),
      //         child: const DeputizationsView(),
      //       ),
      // )
      GoRoute(
        path: kComplatedPageView,
        builder: (context, state) => const ComplatedPageView(),
      ),
      GoRoute(
        path: kRefuseReasonBottomSheet,
        builder: (context, state) => const RefuseReasonBottomSheet(),
      ),
      GoRoute(
        path: kBuyView,
        builder: (context, state) {
          final buyRequest = state.extra as BuyRequest;
          return BuyView(buyRequest: buyRequest);
        },
      ),
      GoRoute(
        path: kCheckView,
        builder: (context, state) {
          final legalCheck = state.extra as LegalCheck;
          return CheckView(legalCheck: legalCheck);
        },
      ),
      GoRoute(
        path: kCheckPropertyView,
        builder: (context, state) {
          final propertyId = state.extra as int;

          return BlocProvider(
            create:
                (_) => CheckPropertyBloc(getIt.get<CheckPropertyRepoImpl>()),
            child: CheckPropertyView(propertyId: propertyId.toString()),
          );
        },
      ),

      GoRoute(
        path: kOwnershipRequestsView,
        builder:
            (context, state) => BlocProvider(
              create:
                  (context) =>
                      CheckDocumentBloc(getIt.get<CheckDocumentRepoImpl>())
                        ..add(FetchCheckDocumentByIdEvent(1)),
              child: const CheckDocumentView(),
            ),
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
