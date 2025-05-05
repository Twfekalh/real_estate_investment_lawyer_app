import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lawyer_app/core/handle_cash.dart';
import 'package:lawyer_app/core/service_locator.dart';
import 'package:lawyer_app/data/repositories/auth_repo_impl.dart';
import 'package:lawyer_app/presentation/auth/bloc/user_bloc.dart';
import 'package:lawyer_app/presentation/home%20page/data/repo/home_page_repo_impl.dart';
import 'package:lawyer_app/presentation/home%20page/presentation/bloc/home_bloc.dart';
import 'package:lawyer_app/presentation/profile/data/repo/profile_repo_impl.dart';
import 'package:lawyer_app/presentation/profile/presentation/bloc/profile_bloc.dart';
import 'package:lawyer_app/untility/cache_helper.dart';
import 'package:lawyer_app/untility/router.dart' show AppRouter;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1) تهيئة الكاش
  await CacheHelper.init();
  await getCache();

  // 2) تهيئة Service Locator (ApiService, AuthRepo)
  setupServiceLocator();
  runApp(const LawyerApp());
}

class LawyerApp extends StatelessWidget {
  const LawyerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserBloc(getIt.get<AuthRepoImpl>())),
        BlocProvider(
          create: (context) => ProfileBloc(getIt.get<ProfileRepoImpl>()),
        ),
        BlocProvider(create: (context) => HomeBloc(getIt.get<HomeRepoImpl>())),
      ],
      child: MaterialApp.router(
        builder: EasyLoading.init(),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
