import 'package:lawyer_app/config/api_config.dart';
import 'package:lawyer_app/core/api_service.dart';
import 'package:lawyer_app/core/constant.dart';
import 'package:lawyer_app/core/enums.dart';
import 'package:lawyer_app/presentation/home%20page/data/model/complate/complate.dart';
import 'package:lawyer_app/presentation/home%20page/data/repo/complate%20repo/complate_repo.dart';
import 'package:lawyer_app/presentation/home%20page/presentation/bloc/complate%20bloc/complate_event.dart';

class ComplateRepoImpl implements ComplateRepo {
  final ApiService _apiService;

  ComplateRepoImpl(this._apiService);

  @override
  Future<dynamic> fetchComplateList(FetchComplateEvent event) async {
    final helperResponse = await _apiService.get(
      token: token,
      endpoint: ApiConfig.getBuyRequestCompleted,
    );

    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        final response = ComplateResponse.fromJson(helperResponse.fullBody!);
        return response;
      } catch (e) {
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }

    return helperResponse;
  }
}
