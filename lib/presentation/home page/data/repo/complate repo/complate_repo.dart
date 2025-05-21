import 'package:lawyer_app/presentation/home%20page/presentation/bloc/complate%20bloc/complate_event.dart';

abstract class ComplateRepo {
  Future<dynamic> fetchComplateList(FetchComplateEvent event);
}
