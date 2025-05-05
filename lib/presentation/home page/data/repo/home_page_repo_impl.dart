import 'package:lawyer_app/config/api_config.dart';
import 'package:lawyer_app/core/api_service.dart';
import 'package:lawyer_app/core/enums.dart';
import 'package:lawyer_app/presentation/home%20page/data/model/home/home.page.model.dart';
import 'package:lawyer_app/presentation/home%20page/data/repo/home_page_repo.dart';
import 'package:lawyer_app/presentation/home%20page/presentation/bloc/home_bloc.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService _apiService;

  HomeRepoImpl(this._apiService);

  @override
  Future fetchHomeData(FetchHomeDataEvent event) async {
    HelperResponse helperResponse = await _apiService.get(
      endpoint: ApiConfig.homeEndpoint,
    );

    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        HomeResponse homeResponse = HomeResponse.fromJson(
          helperResponse.fullBody!,
        );
        return homeResponse;
      } catch (e) {
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }

    return helperResponse;
  }
}
