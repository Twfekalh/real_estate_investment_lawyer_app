part of 'help_bloc.dart';

abstract class HelpEvent {}

class FetchFrequentlyQuestionsEvent extends HelpEvent {
  FetchFrequentlyQuestionsEvent();
  @override
  List<Object?> get props => [];
}
