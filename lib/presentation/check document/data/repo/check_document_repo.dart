import 'package:lawyer_app/presentation/check%20document/presentation/bloc/check_document_bloc.dart';

abstract class CheckDocumentRepo {
  Future<dynamic> fetchCheckDocumentById(FetchCheckDocumentByIdEvent event);
}
