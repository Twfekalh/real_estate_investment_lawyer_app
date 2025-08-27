import 'package:lawyer_app/config/api_config.dart';
import 'package:lawyer_app/core/api_service.dart';
import 'package:lawyer_app/core/constant.dart';
import 'package:lawyer_app/core/enums.dart';
import 'package:lawyer_app/presentation/ownership requests for lawyer/data/models/owner_ships_requests_response/owner_ships_requests_response.dart';
import 'package:lawyer_app/presentation/ownership requests for lawyer/data/repo/owner_ship_requests_repo.dart';
import 'package:lawyer_app/presentation/ownership requests for lawyer/presentation/bloc/owner_ship_requests_bloc.dart';

class OwnerShipRequestsRepoImpl implements OwnerShipRequestsRepo {
  final ApiService _apiService;

  OwnerShipRequestsRepoImpl(this._apiService);

  @override
  Future getAllOwnerShipRequests(GetOwnerShipRequestsEvent event, int page) async {
    HelperResponse helperResponse = await _apiService.get(
      endpoint: "${ApiConfig.getAllOwnershipRequestsForlawyer}?page=$page",
      token: token,
    );
    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        return OwnerShipsRequestsResponse.fromMessageDataRequestsId2InvestmentCertificateId2PropertyLocationDamascusYaafourSellerId1SellerNameBuyerId4BuyerNameTax90StatusPendingCreatedAt20250827T123740000000ZUpdatedAt20250827T123740000000ZId1InvestmentCertificateId2PropertyLocationDamascusYaafourSellerId1SellerNameBuyerId3BuyerNameTax90StatusPendingCreatedAt20250827T122735000000ZUpdatedAt20250827T122735000000ZPaginationCurrentPage1LastPage1PerPage15Total2NextPageUrlNullPrevPageUrlNull(helperResponse.fullBody!);
      } catch (e) {
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }
    return helperResponse;
  }

  @override
  Future acceptTransferOwnership(AcceptTransferOwnershipEvent event) async {
    HelperResponse helperResponse = await _apiService.post(
      endpoint: '${ApiConfig.acceptTransferOwnershipRequest}/${event.id}',
      token: token,
    );
    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        return helperResponse.fullBody!['message'];
      } catch (e) {
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }
    return helperResponse;
  }
} 