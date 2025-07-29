part of 'check_bloc.dart';

sealed class CheckState {}

final class CheckInitial extends CheckState {}

final class CheckInLoadingState extends CheckState {}

final class CheckLoadingFailure extends CheckState {
  final HelperResponse helperResponse;

  CheckLoadingFailure({required this.helperResponse});
}

final class AcceptDoneState extends CheckState {
  final AcceptResponse acceptResponse;

  AcceptDoneState({required this.acceptResponse});
}

final class RejectDoneState extends CheckState {
  final RejectResponse rejectResponse;

  RejectDoneState({required this.rejectResponse});
}
