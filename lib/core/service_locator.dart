// lib/core/service_locator.dart
import 'package:get_it/get_it.dart';
import 'package:lawyer_app/data/repositories/auth_repo.dart';
import 'package:lawyer_app/data/repositories/auth_repo_impl.dart';
import 'api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<ApiService>(() => ApiService());

  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(getIt<ApiService>()),
  );
}
