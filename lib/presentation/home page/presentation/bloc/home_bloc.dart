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
      emit(HomeLoadingState());
      final response = await homeRepoImpl.fetchHomeData(event);

      if (response is HomeResponse) {
        emit(HomeLoadedState(homeResponse: response));
      } else {
        emit(HomeErrorState(helperResponse: response));
      }
    });
  }
}
