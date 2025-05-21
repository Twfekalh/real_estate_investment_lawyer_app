import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawyer_app/presentation/home%20page/data/model/complate/complate.dart';
import 'package:lawyer_app/presentation/home%20page/data/repo/complate%20repo/complate_repo_impl.dart';

import 'complate_event.dart';
import 'complate_state.dart';

class ComplateBloc extends Bloc<ComplateEvent, ComplateState> {
  final ComplateRepoImpl _repo;

  ComplateBloc(this._repo) : super(ComplateInitial()) {
    on<FetchComplateEvent>(_onFetch);
  }

  Future<void> _onFetch(
    FetchComplateEvent event,
    Emitter<ComplateState> emit,
  ) async {
    print('FetchComplateEvent triggered');
    emit(ComplateLoadingState());

    final response = await _repo.fetchComplateList(event);
    print('Response received: $response');

    if (response is ComplateResponse) {
      print('ComplateLoadedState emitted');
      emit(ComplateLoadedState(complateResponse: response));
    } else {
      print('ComplateErrorState emitted');
      emit(ComplateErrorState(helperResponse: response));
    }
  }
}
