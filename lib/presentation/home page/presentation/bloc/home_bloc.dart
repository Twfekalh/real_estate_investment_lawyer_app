import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawyer_app/core/api_service.dart';
import 'package:lawyer_app/presentation/home%20page/data/model/home/home.page.model.dart';
import 'package:lawyer_app/presentation/home%20page/data/repo/home_page_repo_impl.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepoImpl homeRepoImpl;

  HomeBloc(this.homeRepoImpl) : super(HomeInitial()) {
    on<FetchHomeDataEvent>((event, emit) async {
      print(' FetchHomeDataEvent triggered');
      emit(HomeLoadingState());
      final response = await homeRepoImpl.fetchHomeData(event);
      print(' Response received: $response');
      if (response is HomeResponse) {
        print(' HomeLoadedState emitted');
        emit(HomeLoadedState(homeResponse: response));
      } else {
        print(' HomeErrorState emitted');
        emit(HomeErrorState(helperResponse: response));
      }
    });
  }
}
