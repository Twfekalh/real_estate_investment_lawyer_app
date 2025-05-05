// part of 'check_bloc.dart';

// @immutable
// sealed class CheckState {}

// /// Initial state before any action
// final class CheckInitial extends CheckState {}

// /// Loading state during API calls
// final class CheckInLoadingState extends CheckState {}

// /// Failure state with the low-level helper response
// final class CheckLoadingFailure extends CheckState {
//   final HelperResponse helperResponse;
//   CheckLoadingFailure({required this.helperResponse});
// }

// /// State when GET all requests succeeds
// final class CheckGetAllDoneState extends CheckState {
//   final CheckResponse checkResponse;
//   CheckGetAllDoneState({required this.checkResponse});
// }

// /// State when accept request succeeds
// final class AcceptDoneState extends CheckState {
//   final AcceptResponse acceptResponse;
//   AcceptDoneState({required this.acceptResponse});
// }

// /// State when reject request succeeds
// final class RejectDoneState extends CheckState {
//   final RejectResponse rejectResponse;
//   RejectDoneState({required this.rejectResponse});
// }
