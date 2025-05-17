part of 'check_proparty_bloc.dart';

abstract class CheckPropertyState {
  const CheckPropertyState();
}

class CheckPropertyInitial extends CheckPropertyState {}

class CheckPropertyLoadingState extends CheckPropertyState {}

/// عند النجاح: تحوي الـ response
class CheckPropertyLoadedState extends CheckPropertyState {
  final CheckPropertyResponse checkPropertyResponse;
  CheckPropertyLoadedState({required this.checkPropertyResponse});
}

class CheckPropertyErrorState extends CheckPropertyState {
  final HelperResponse helperResponse;
  CheckPropertyErrorState({required this.helperResponse});
}
// class CheckPropertyLoadedState extends CheckPropertyState {
//   final CheckPropertyResponse checkPropertyResponse;

//   CheckPropertyLoadedState({required this.checkPropertyResponse});
// }

// class CheckPropertyErrorState extends CheckPropertyState {
//   final HelperResponse helperResponse;

//   CheckPropertyErrorState({required this.helperResponse});
// }
