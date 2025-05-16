import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawyer_app/presentation/help/data/models/help.dart';
import 'package:lawyer_app/presentation/help/data/repo/help_repo_impl.dart';

part 'help_event.dart';
part 'help_state.dart';

class HelpBloc extends Bloc<HelpEvent, HelpState> {
  final HelpRepoImpl helpRepoImpl;

  HelpBloc(this.helpRepoImpl) : super(HelpInitial()) {
    on<FetchFrequentlyQuestionsEvent>(_onFetch);
  }

  Future<void> _onFetch(
    FetchFrequentlyQuestionsEvent event,
    Emitter<HelpState> emit,
  ) async {
    emit(HelpLoadingState());
    final response = await helpRepoImpl.getFrequentlyQuestions(event);
    if (response is HelpResponse) {
      emit(HelpLoadedState(helpResponse: response));
    } else {
      emit(HelpErrorState(helperResponse: response));
    }
  }
}
