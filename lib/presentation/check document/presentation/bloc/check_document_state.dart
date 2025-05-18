part of 'check_document_bloc.dart';

abstract class CheckDocumentState {
  const CheckDocumentState();
}

class CheckDocumentInitial extends CheckDocumentState {}

class CheckDocumentLoadingState extends CheckDocumentState {}

class CheckDocumentLoadedState extends CheckDocumentState {
  final CheckDocumentResponse checkDocumentResponse;

  CheckDocumentLoadedState({required this.checkDocumentResponse});
}

class CheckDocumentErrorState extends CheckDocumentState {
  final HelperResponse helperResponse;

  CheckDocumentErrorState({required this.helperResponse});
}
