import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lawyer_app/core/api_service.dart';
import 'package:lawyer_app/presentation/ownership requests for lawyer/data/models/owner_ships_requests_response/request.dart';
import 'package:lawyer_app/presentation/ownership requests for lawyer/data/models/owner_ships_requests_response/owner_ships_requests_response.dart';
import 'package:lawyer_app/presentation/ownership requests for lawyer/data/repo/owner_ship_requests_repo_impl.dart';

part 'owner_ship_requests_event.dart';
part 'owner_ship_requests_state.dart';

class OwnerShipRequestsBloc extends Bloc<OwnerShipRequestsEvent, OwnerShipRequestsState> {
  final OwnerShipRequestsRepoImpl ownerShipRequestsRepoImpl;

  bool _isFetching = false;

  OwnerShipRequestsBloc(this.ownerShipRequestsRepoImpl)
      : super(OwnerShipRequestsInitial()) {
    on<GetOwnerShipRequestsEvent>((event, emit) async {
      if (_isFetching) return;

      final currentState = state;

      if (event.refresh) {
        emit(OwnerShipRequestsLoading());
      } else if (currentState is OwnerShipRequestsSuccess) {
        if (currentState.hasReachedMax) {
          return;
        }
        emit(currentState.copyWith(isLoadingMore: true));
      } else {
        emit(OwnerShipRequestsLoading());
      }

      _isFetching = true;
      try {
        final int nextPage;
        if (event.refresh) {
          nextPage = 1;
        } else if (currentState is OwnerShipRequestsSuccess) {
          nextPage = currentState.page + 1;
        } else {
          nextPage = 1;
        }

        final response = await ownerShipRequestsRepoImpl.getAllOwnerShipRequests(
          event,
          nextPage,
        );

        if (response is OwnerShipsRequestsResponse) {
          final newItems = response.data?.requests ?? <Request>[];
          final pagination = response.data?.pagination;
          final bool reachedMaxByServer = pagination == null
              ? (newItems.isEmpty)
              : (pagination.currentPage != null && pagination.lastPage != null
                  ? pagination.currentPage! >= pagination.lastPage!
                  : newItems.isEmpty);

          if (event.refresh) {
            emit(
              OwnerShipRequestsSuccess(
                requests: newItems,
                hasReachedMax: reachedMaxByServer,
                page: pagination?.currentPage ?? nextPage,
                isLoadingMore: false,
              ),
            );
          } else if (currentState is OwnerShipRequestsSuccess) {
            emit(
              currentState.copyWith(
                requests: List.of(currentState.requests)..addAll(newItems),
                hasReachedMax: reachedMaxByServer,
                page: pagination?.currentPage ?? nextPage,
                isLoadingMore: false,
              ),
            );
          } else {
            emit(
              OwnerShipRequestsSuccess(
                requests: newItems,
                hasReachedMax: reachedMaxByServer,
                page: pagination?.currentPage ?? nextPage,
                isLoadingMore: false,
              ),
            );
          }
        } else {
          emit(OwnerShipRequestsFailure(helperResponse: response));
        }
      } finally {
        _isFetching = false;
      }
    });

    on<AcceptTransferOwnershipEvent>((event, emit) async {
      emit(AcceptTransferLoading());
      final response = await ownerShipRequestsRepoImpl.acceptTransferOwnership(event);
      if (response is String) {
        emit(AcceptTransferSuccess(successMessage: response));
        add(const GetOwnerShipRequestsEvent(refresh: true));
      } else if (response is HelperResponse) {
        emit(AcceptTransferFailure(errMessage: response.response));
      } else {
        emit(AcceptTransferFailure(errMessage: 'Something went wrong'));
      }
    });
  }
}
