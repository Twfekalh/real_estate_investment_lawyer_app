// import 'package:bloc/bloc.dart';

// import 'package:lawyer_app/presentation/check/data/models/Accept/Accept_pesponse.dart';
// import 'package:lawyer_app/presentation/check/data/models/reject/reject_response.dart';
// import 'package:lawyer_app/presentation/check/data/repo/legal_check_repo.dart';
// import 'package:lawyer_app/presentation/check/presentation/bloc/check_bloc.dart';

// class BuyBloc extends Bloc<> {
//   final LegalCheckRepo _repo;

//   BuyBloc(this._repo) : super(()) {
//     on<AcceptRequestEvent>(_onAccept);
//     on<RejectRequestEvent>(_onReject);
//   }

//   Future<void> _onAccept(
//     AcceptRequestEvent event,
//     Emitter<BuyState> emit,
//   ) async {
//     emit(CheckInLoadingState());
//     final response = await _repo.acceptRequest(event);
//     if (response is AcceptResponse) {
//       emit(AcceptDoneState(acceptResponse: response));
//     } else {
//       emit(CheckLoadingFailure(helperResponse: response));
//     }
//   }

//   Future<void> _onReject(
//     RejectRequestEvent event,
//     Emitter<BuyState> emit,
//   ) async {
//     emit(CheckInLoadingState());
//     final response = await _repo.rejectRequest(event);
//     if (response is RejectResponse) {
//       emit(RejectDoneState(rejectResponse: response));
//     } else {
//       emit(CheckLoadingFailure(helperResponse: response));
//     }
//   }
// }
