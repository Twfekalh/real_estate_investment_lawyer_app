import 'package:bloc/bloc.dart';
import 'package:lawyer_app/presentation/check/data/models/check/Accept/Accept_pesponse.dart';
import 'package:lawyer_app/presentation/check/data/models/check/check_pesponse.dart';
import 'package:lawyer_app/presentation/check/data/models/check/reject/reject_response.dart';
import 'package:lawyer_app/presentation/check/data/repo/legal_check_repo.dart';
import 'package:meta/meta.dart';
import 'package:lawyer_app/core/api_service.dart';

part 'check_event.dart';
part 'check_state.dart';

class CheckBloc extends Bloc<CheckEvent, CheckState> {
  final LegalCheckRepo _repo;

  CheckBloc(this._repo) : super(CheckInitial()) {
    on<GetAllRequestsEvent>(_onGetAll);
    on<AcceptRequestEvent>(_onAccept);
    on<RejectRequestEvent>(_onReject);
  }

  Future<void> _onGetAll(
    GetAllRequestsEvent event,
    Emitter<CheckState> emit,
  ) async {
    emit(CheckInLoadingState());
    final response = await _repo.getAllRequests(event);
    if (response is CheckResponse) {
      emit(CheckGetAllDoneState(checkResponse: response));
    } else {
      emit(CheckLoadingFailure(helperResponse: response));
    }
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
