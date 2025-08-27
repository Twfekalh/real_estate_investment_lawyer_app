import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lawyer_app/core/api_service.dart';
import 'package:lawyer_app/presentation/deputization/data/models/deputizations_response/deputization.dart';
import 'package:lawyer_app/presentation/deputization/data/models/deputizations_response/deputizations_response.dart';
import 'package:lawyer_app/presentation/deputization/data/repo/deputizations_repo_impl.dart';

part 'deputizations_event.dart';
part 'deputizations_state.dart';

class DeputizationsBloc extends Bloc<DeputizationsEvent, DeputizationsState> {
  final DeputizationsRepoImpl deputizationsRepoImpl;

  bool _isFetching = false;

  DeputizationsBloc(this.deputizationsRepoImpl)
    : super(DeputizationsInitial()) {
    on<GetDeputizationsEvent>((event, emit) async {
      if (_isFetching) return;

      final currentState = state;

      // Refresh path: reset to first page
      if (event.refresh) {
        emit(DeputizationsLoading());
      } else if (currentState is DeputizationsSuccess) {
        // stop if already max
        if (currentState.hasReachedMax) {
          return;
        }
        // mark loading more to show bottom shimmer
        emit(currentState.copyWith(isLoadingMore: true));
      } else {
        emit(DeputizationsLoading());
      }

      _isFetching = true;

      try {
        final int nextPage;
        if (event.refresh) {
          nextPage = 1;
        } else if (currentState is DeputizationsSuccess) {
          nextPage = currentState.page + 1;
        } else {
          nextPage = 1;
        }

        final response = await deputizationsRepoImpl.getAllDeputizations(
          event,
          nextPage,
        );

        if (response is DeputizationsResponse) {
          final newItems = response.data?.deputizations ?? <Deputization>[];
          final pagination = response.data?.pagination;
          final bool reachedMaxByServer =
              pagination == null
                  ? (newItems.isEmpty)
                  : (pagination.currentPage != null && pagination.lastPage != null
                      ? pagination.currentPage! >= pagination.lastPage!
                      : newItems.isEmpty);

          if (event.refresh) {
            emit(
              DeputizationsSuccess(
                deputizations: newItems,
                hasReachedMax: reachedMaxByServer,
                page: pagination?.currentPage ?? nextPage,
                isLoadingMore: false,
              ),
            );
          } else if (currentState is DeputizationsSuccess) {
            emit(
              currentState.copyWith(
                deputizations: List.of(currentState.deputizations)..addAll(newItems),
                hasReachedMax: reachedMaxByServer,
                page: pagination?.currentPage ?? nextPage,
                isLoadingMore: false,
              ),
            );
          } else {
            emit(
              DeputizationsSuccess(
                deputizations: newItems,
                hasReachedMax: reachedMaxByServer,
                page: pagination?.currentPage ?? nextPage,
                isLoadingMore: false,
              ),
            );
          }
        } else {
          emit(DeputizationsFailure(helperResponse: response));
        }
      } finally {
        _isFetching = false;
      }
    });
        on<ProccessDeputazationEvent>((event, emit) async {
      emit(ProccessDeputizationsLoading());

      final response = await deputizationsRepoImpl.processDeputizations(
        event,
      );
      if (response is String) {
        emit(ProccessDeputizationsSuccesss(successMessage: response));
      } else {
        emit(ProccessDeputizationsFailure(errMessage: response));
      }
    });
    
  }
}
