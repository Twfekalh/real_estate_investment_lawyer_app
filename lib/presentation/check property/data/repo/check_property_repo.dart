import 'package:lawyer_app/presentation/check%20property/presentation/bloc/check_proparty_bloc.dart';

abstract class CheckPropertyRepo {
  Future<dynamic> fetchPropertyById(FetchCheckPropertyByIdEvent event);
}
