import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawyer_app/core/service_locator.dart';
import 'package:lawyer_app/data/repositories/auth_repo_impl.dart';
import 'package:lawyer_app/presentation/auth/bloc/user_bloc.dart';
import 'package:lawyer_app/untility/cache_helper.dart';
import 'package:lawyer_app/untility/router.dart' show AppRouter;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1) تهيئة الكاش
  await CacheHelper.init();

  // 2) تهيئة Service Locator (ApiService, AuthRepo)
  setupServiceLocator();

  runApp(const LawyerApp());
}

class LawyerApp extends StatelessWidget {
  const LawyerApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 3) نوفّر الـ UserBloc لكل التطبيق
    final authRepo = getIt<AuthRepoImpl>();
    return BlocProvider(
      create: (_) => UserBloc(authRepo),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
