part of 'check_proparty_bloc.dart';

abstract class CheckPropertyState {}

class CheckPropertyInitial extends CheckPropertyState {}

class CheckPropertyLoadingState extends CheckPropertyState {}

class CheckPropertyLoadedState extends CheckPropertyState {
  final CheckPropertyResponse checkPropertyResponse;

  CheckPropertyLoadedState({required this.checkPropertyResponse});
}

class CheckPropertyErrorState extends CheckPropertyState {
  final HelperResponse helperResponse;

  CheckPropertyErrorState({required this.helperResponse});
}
