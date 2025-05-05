part of 'home_bloc.dart';

sealed class HomeEvent {}

class FetchHomeDataEvent extends HomeEvent {
  FetchHomeDataEvent();

  @override
  List<Object?> get props => [];
}
