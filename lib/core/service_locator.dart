import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:lawyer_app/config/api_config.dart';
import 'package:lawyer_app/core/api_service.dart';
import 'package:lawyer_app/data/repositories/auth_repo_impl.dart';

final GetIt getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(
        BaseOptions(
          baseUrl: ApiConfig.baseUrl,
          sendTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 30),
          connectTimeout: const Duration(seconds: 30),
          receiveDataWhenStatusError: true,
          maxRedirects: 5,
        ),
      ),
    ),
  );
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(getIt.get<ApiService>()));
}
