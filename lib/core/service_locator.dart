import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:lawyer_app/config/api_config.dart';
import 'package:lawyer_app/core/api_service.dart';
import 'package:lawyer_app/data/repositories/auth_repo_impl.dart';
import 'package:lawyer_app/presentation/check%20document/data/repo/check_document_repo_impl.dart';
import 'package:lawyer_app/presentation/check%20property/data/repo/check_property_repo.dart';
import 'package:lawyer_app/presentation/check%20property/data/repo/check_property_repo_impl.dart';
import 'package:lawyer_app/presentation/check/data/repo/legal_check_repo.dart';
import 'package:lawyer_app/presentation/check/data/repo/legal_check_repo_impl.dart';
import 'package:lawyer_app/presentation/help/data/repo/help_repo_impl.dart';
import 'package:lawyer_app/presentation/home%20page/data/repo/home_page_repo_impl.dart';
import 'package:lawyer_app/presentation/profile/data/repo/profile_repo_impl.dart';

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
  getIt.registerSingleton<ProfileRepoImpl>(
    ProfileRepoImpl(getIt.get<ApiService>()),
  );
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<LegalCheckRepo>(
    LegalCheckRepoImpl(getIt.get<ApiService>()),
  );
  getIt.registerSingleton<HelpRepoImpl>(HelpRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<CheckPropertyRepoImpl>(
    CheckPropertyRepoImpl(getIt.get<ApiService>()),
  );
  getIt.registerSingleton<CheckDocumentRepoImpl>(
    CheckDocumentRepoImpl(getIt.get<ApiService>()),
  );
}
