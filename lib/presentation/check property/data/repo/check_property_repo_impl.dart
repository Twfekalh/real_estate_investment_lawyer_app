import 'package:lawyer_app/config/api_config.dart';
import 'package:lawyer_app/core/api_service.dart';
import 'package:lawyer_app/core/enums.dart';
import 'package:lawyer_app/presentation/check%20property/data/model/check/check.property.dart';
import 'package:lawyer_app/presentation/check%20property/data/repo/check_property_repo.dart';
import 'package:lawyer_app/presentation/check%20property/presentation/bloc/check_proparty_bloc.dart';

class CheckPropertyRepoImpl implements CheckPropertyRepo {
  final ApiService _apiService;

  CheckPropertyRepoImpl(this._apiService);

  @override
  Future<dynamic> fetchPropertyById(FetchCheckPropertyByIdEvent event) async {
    final helperResponse = await _apiService.get(
      endpoint: '${ApiConfig.getCheckPropertyById}/${event.id}',
    );

    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        final response = CheckPropertyResponse.fromJson(
          helperResponse.fullBody!,
        );
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
