import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lawyer_app/core/api_service.dart';
import 'package:lawyer_app/presentation/check/data/models/Accept/Accept_pesponse.dart';
import 'package:lawyer_app/presentation/check/data/models/reject/reject_response.dart';
import 'package:lawyer_app/presentation/check/data/repo/legal_check_repo.dart';
import 'package:meta/meta.dart';

part 'check_event.dart';
part 'check_state.dart';

class CheckBloc extends Bloc<CheckEvent, CheckState> {
  final LegalCheckRepo _repo;

  CheckBloc(this._repo) : super(CheckInitial()) {
    on<AcceptRequestEvent>(_onAccept);
    on<RejectRequestEvent>(_onReject);
  }

  Future<void> _onAccept(
    AcceptRequestEvent event,
    Emitter<CheckState> emit,
  ) async {
    emit(CheckInLoadingState());
    final response = await _repo.acceptRequest(event);
    if (response is AcceptResponse) {
      emit(AcceptDoneState(acceptResponse: response));
    } else {
      emit(CheckLoadingFailure(helperResponse: response));
    }
  }

  Future<void> _onReject(
    RejectRequestEvent event,
    Emitter<CheckState> emit,
  ) async {
    emit(CheckInLoadingState());
    final response = await _repo.rejectRequest(event);
    if (response is RejectResponse) {
      emit(RejectDoneState(rejectResponse: response));
    } else {
      emit(CheckLoadingFailure(helperResponse: response));
    }
  }
}
