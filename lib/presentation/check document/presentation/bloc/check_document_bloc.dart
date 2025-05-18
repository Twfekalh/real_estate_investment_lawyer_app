import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawyer_app/core/api_service.dart';
import 'package:lawyer_app/presentation/check%20document/data/model/check/check.document.dart';

import 'package:lawyer_app/presentation/check%20document/data/repo/check_document_repo_impl.dart';

part 'check_document_event.dart';
part 'check_document_state.dart';

class CheckDocumentBloc extends Bloc<CheckDocumentEvent, CheckDocumentState> {
  final CheckDocumentRepoImpl checkDocumentRepoImpl;

  CheckDocumentBloc(this.checkDocumentRepoImpl)
    : super(CheckDocumentInitial()) {
    on<FetchCheckDocumentByIdEvent>((event, emit) async {
      emit(CheckDocumentLoadingState());

      final response = await checkDocumentRepoImpl.fetchCheckDocumentById(
        event,
      );

      if (response is CheckDocumentResponse) {
        emit(CheckDocumentLoadedState(checkDocumentResponse: response));
      } else {
        emit(CheckDocumentErrorState(helperResponse: response));
      }
    });
  }
}
