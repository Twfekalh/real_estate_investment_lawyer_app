part of 'help_bloc.dart';

abstract class HelpState {
  const HelpState();
}

class HelpInitial extends HelpState {}

class HelpLoadingState extends HelpState {}

class HelpLoadedState extends HelpState {
  final HelpResponse helpResponse;
  const HelpLoadedState({required this.helpResponse});
}

class HelpErrorState extends HelpState {
  final HelpResponse helperResponse;
  const HelpErrorState({required this.helperResponse});
}
