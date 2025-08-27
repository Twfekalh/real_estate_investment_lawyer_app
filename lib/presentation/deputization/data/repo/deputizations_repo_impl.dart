import 'package:lawyer_app/config/api_config.dart';
import 'package:lawyer_app/core/api_service.dart';
import 'package:lawyer_app/core/constant.dart';
import 'package:lawyer_app/core/enums.dart';
import 'package:lawyer_app/presentation/deputization/data/models/deputizations_response/deputizations_response.dart';
import 'package:lawyer_app/presentation/deputization/data/repo/deputizations_repo.dart';
import 'package:lawyer_app/presentation/deputization/presentation/bloc/deputizations_bloc.dart';

class DeputizationsRepoImpl implements DeputizationsRepo {
  final ApiService _apiService;

  DeputizationsRepoImpl(this._apiService);
  @override
  Future getAllDeputizations(GetDeputizationsEvent event, int page) async {
    HelperResponse helperResponse = await _apiService.get(
      endpoint: "${ApiConfig.getAllDeputizationsForLawyer}?page=$page",
      token: token,
    );
    print(" end point: ${ApiConfig.getAllDeputizationsForLawyer}?page=$page");
    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        print(
          " the final rspponnnnnn${DeputizationsResponse.from(helperResponse.fullBody!).data!.deputizations!.length}  ${helperResponse.fullBody}",
        );
        return DeputizationsResponse.from(helperResponse.fullBody!);
      } catch (e) {
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }
    return helperResponse;
  }
  
  @override
  Future processDeputizations(ProccessDeputazationEvent event) async {
       HelperResponse helperResponse = await _apiService.post(
      endpoint:'${ApiConfig.processDeputizationsByLawyer}/${event.id}',
      token: token,
    );
        if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
       
        return helperResponse.fullBody!['message'] ;
      } catch (e) {
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }
    return helperResponse;
  }
  // Future getAllDeputizations(DeputizationsEvent event, int page) async {
  //   final helperResponse = await _apiService.get(
  //     token: token,
  //     endpoint:
  //         // ApiConfig.getAllDeputizationsForLawyer,
  //         "${ApiConfig.getAllDeputizationsForLawyer}?page=$page",
  //   );
  //   print("the deputazation response ${helperResponse.fullBody}");
  //   print("${ApiConfig.getAllDeputizationsForLawyer}?page=$page");

  //   if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
  //     try {
  //       final response = DeputizationsResponse.from(helperResponse.fullBody!);
  //       print("the deputazation response $response.");
  //       return response;
  //     } catch (e) {
  //       return helperResponse.copyWith(
  //         servicesResponse: ServicesResponseStatues.modelError,
  //       );
  //     }
  //   }

  //   return helperResponse;
  // }
}
