import 'package:lawyer_app/presentation/home%20page/presentation/bloc/home_bloc.dart';

abstract class HomeRepo {
  Future fetchHomeData(FetchHomeDataEvent event);
}
