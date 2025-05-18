part of 'check_document_bloc.dart';

abstract class CheckDocumentEvent {
  const CheckDocumentEvent();
}

class FetchCheckDocumentByIdEvent extends CheckDocumentEvent {
  final int id;

  FetchCheckDocumentByIdEvent(this.id);
}
