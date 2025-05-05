part of 'home_bloc.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeErrorState extends HomeState {
  final HelperResponse helperResponse;

  HomeErrorState({required this.helperResponse});

  @override
  List<Object?> get props => [
    helperResponse.servicesResponse,
    helperResponse.response,
  ];
}

class HomeLoadedState extends HomeState {
  final HomeResponse homeResponse;

  HomeLoadedState({required this.homeResponse});

  @override
  List<Object?> get props => [homeResponse];
}
