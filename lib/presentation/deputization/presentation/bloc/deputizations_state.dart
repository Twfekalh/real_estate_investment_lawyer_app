part of 'deputizations_bloc.dart';

sealed class DeputizationsState extends Equatable {
  const DeputizationsState();

  @override
  List<Object> get props => [];
}

final class DeputizationsInitial extends DeputizationsState {}

final class DeputizationsFailure extends DeputizationsState {
  final HelperResponse helperResponse;

  const DeputizationsFailure({required this.helperResponse});
}

class DeputizationsSuccess extends DeputizationsState {
  final List<Deputization> deputizations;
  final bool hasReachedMax;
  final int page;
  final bool isLoadingMore;

  DeputizationsSuccess({
    required this.deputizations,
    required this.hasReachedMax,
    required this.page,
    this.isLoadingMore = false,
  });

  DeputizationsSuccess copyWith({
    List<Deputization>? deputizations,
    bool? hasReachedMax,
    int? page,
    bool? isLoadingMore,
  }) {
    return DeputizationsSuccess(
      deputizations: deputizations ?? this.deputizations,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }

  @override
  List<Object> get props => [deputizations, hasReachedMax, page, isLoadingMore];
}

final class DeputizationsLoading extends DeputizationsState {}

final class ProccessDeputizationsLoading extends DeputizationsState {}

final class ProccessDeputizationsFailure extends DeputizationsState {
  final String errMessage;

  ProccessDeputizationsFailure({required this.errMessage});
}

final class ProccessDeputizationsSuccesss extends DeputizationsState {
  final String successMessage;

  ProccessDeputizationsSuccesss({required this.successMessage});
}
