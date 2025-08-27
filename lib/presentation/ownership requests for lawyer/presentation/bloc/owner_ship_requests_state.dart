part of 'owner_ship_requests_bloc.dart';

sealed class OwnerShipRequestsState extends Equatable {
  const OwnerShipRequestsState();
  
  @override
  List<Object> get props => [];
}

final class OwnerShipRequestsInitial extends OwnerShipRequestsState {}

final class OwnerShipRequestsLoading extends OwnerShipRequestsState {}

final class OwnerShipRequestsFailure extends OwnerShipRequestsState {
  final HelperResponse helperResponse;

  const OwnerShipRequestsFailure({required this.helperResponse});
}

class OwnerShipRequestsSuccess extends OwnerShipRequestsState {
  final List<Request> requests;
  final bool hasReachedMax;
  final int page;
  final bool isLoadingMore;

  OwnerShipRequestsSuccess({
    required this.requests,
    required this.hasReachedMax,
    required this.page,
    this.isLoadingMore = false,
  });

  OwnerShipRequestsSuccess copyWith({
    List<Request>? requests,
    bool? hasReachedMax,
    int? page,
    bool? isLoadingMore,
  }) {
    return OwnerShipRequestsSuccess(
      requests: requests ?? this.requests,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }

  @override
  List<Object> get props => [requests, hasReachedMax, page, isLoadingMore];
}

final class AcceptTransferLoading extends OwnerShipRequestsState {}

final class AcceptTransferFailure extends OwnerShipRequestsState {
  final String errMessage;

  AcceptTransferFailure({required this.errMessage});
}

final class AcceptTransferSuccess extends OwnerShipRequestsState {
  final String successMessage;

  AcceptTransferSuccess({required this.successMessage});
}
