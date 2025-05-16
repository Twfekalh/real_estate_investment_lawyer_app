import 'package:lawyer_app/presentation/help/presentation/bloc/help_bloc.dart';

abstract class HelpRepo {
  Future getFrequentlyQuestions(FetchFrequentlyQuestionsEvent event);
}
