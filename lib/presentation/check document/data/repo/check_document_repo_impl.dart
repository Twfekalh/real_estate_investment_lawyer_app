import 'package:lawyer_app/config/api_config.dart';
import 'package:lawyer_app/core/api_service.dart';
import 'package:lawyer_app/core/enums.dart';
import 'package:lawyer_app/presentation/check%20document/data/model/check/check.document.dart';

import 'package:lawyer_app/presentation/check%20document/data/repo/check_document_repo.dart';
import 'package:lawyer_app/presentation/check%20document/presentation/bloc/check_document_bloc.dart';

class CheckDocumentRepoImpl implements CheckDocumentRepo {
  final ApiService _apiService;

  CheckDocumentRepoImpl(this._apiService);

  @override
  Future<dynamic> fetchCheckDocumentById(
    FetchCheckDocumentByIdEvent event,
  ) async {
    final helperResponse = await _apiService.get(
      endpoint: '${ApiConfig.getCheckDocumentById}/${event.id}',
    );

    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        final response = CheckDocumentResponse.fromJson(
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
