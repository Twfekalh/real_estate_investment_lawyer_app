part of 'owner_ship_requests_bloc.dart';

sealed class OwnerShipRequestsEvent extends Equatable {
  const OwnerShipRequestsEvent();

  @override
  List<Object> get props => [];
}

class GetOwnerShipRequestsEvent extends OwnerShipRequestsEvent {
  final bool refresh;

  const GetOwnerShipRequestsEvent({this.refresh = false});
}

class AcceptTransferOwnershipEvent extends OwnerShipRequestsEvent {
  final String id;

  const AcceptTransferOwnershipEvent({required this.id});
}
