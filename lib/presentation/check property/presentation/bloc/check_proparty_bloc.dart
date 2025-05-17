import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawyer_app/core/api_service.dart';
import 'package:lawyer_app/presentation/check%20property/data/model/check/check.property.dart';
import 'package:lawyer_app/presentation/check%20property/data/repo/check_property_repo_impl.dart';

part 'check_property_event.dart';
part 'check_property_state.dart';

class CheckPropertyBloc extends Bloc<CheckPropertyEvent, CheckPropertyState> {
  final CheckPropertyRepoImpl checkPropertyRepoImpl;

  CheckPropertyBloc(this.checkPropertyRepoImpl)
    : super(CheckPropertyInitial()) {
    on<FetchCheckPropertyByIdEvent>((event, emit) async {
      print('FetchCheckPropertyByIdEvent triggered');
      emit(CheckPropertyLoadingState());

      final response = await checkPropertyRepoImpl.fetchPropertyById(event);
      print('Response received: $response');

      if (response is CheckPropertyResponse) {
        print('CheckPropertyLoadedState emitted');
        emit(CheckPropertyLoadedState(checkPropertyResponse: response));
      } else {
        print('CheckPropertyErrorState emitted');
        emit(CheckPropertyErrorState(helperResponse: response));
      }
    });
  }
}
