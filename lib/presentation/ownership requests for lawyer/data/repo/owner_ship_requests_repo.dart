import 'package:lawyer_app/presentation/ownership requests for lawyer/presentation/bloc/owner_ship_requests_bloc.dart';

abstract class OwnerShipRequestsRepo {
  Future getAllOwnerShipRequests(GetOwnerShipRequestsEvent event, int page);
  Future acceptTransferOwnership(AcceptTransferOwnershipEvent event);
} 