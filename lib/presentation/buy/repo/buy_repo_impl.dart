// import 'package:lawyer_app/config/api_config.dart';
// import 'package:lawyer_app/core/api_service.dart';
// import 'package:lawyer_app/core/constant.dart';
// import 'package:lawyer_app/core/enums.dart';
// import 'package:lawyer_app/presentation/buy/repo/buy_repo.dart';
// import 'package:lawyer_app/presentation/check/data/models/Accept/Accept_pesponse.dart';
// import 'package:lawyer_app/presentation/check/data/models/reject/reject_response.dart';

// import 'package:lawyer_app/presentation/check/presentation/bloc/check_bloc.dart';

// class BuyRepoImpl implements BuyRepo {
//   final ApiService _apiService;

//   BuyRepoImpl(this._apiService);

//   @override
//   Future acceptRequest(AcceptRequestEvent event) async {
//     final helperResponse = await _apiService.post(
//       endpoint: '${ApiConfig.acceptRequest}/${event.requestId}',
//       token: token,
//     );

//     if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
//       try {
//         final response = AcceptResponse.fromJson(helperResponse.fullBody!);
//         return response;
//       } catch (e) {
//         return helperResponse.copyWith(
//           servicesResponse: ServicesResponseStatues.modelError,
//         );
//       }
//     }

//     return helperResponse;
//   }

//   @override
//   Future rejectRequest(RejectRequestEvent event) async {
//     final helperResponse = await _apiService.post(
//       endpoint: '${ApiConfig.rejectRequest}/${event.requestId}',
//       token: token,
//       data: {'description': event.reason},
//     );

//     if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
//       try {
//         final response = RejectResponse.fromJson(helperResponse.fullBody!);
//         return response;
//       } catch (e) {
//         return helperResponse.copyWith(
//           servicesResponse: ServicesResponseStatues.modelError,
//         );
//       }
//     }

//     return helperResponse;
//   }
// }
