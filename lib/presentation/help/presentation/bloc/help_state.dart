part of 'help_bloc.dart';

abstract class HelpState {
  const HelpState();
}

class HelpInitial extends HelpState {
  const HelpInitial();
}

class HelpLoadingState extends HelpState {
  const HelpLoadingState();
}

class HelpLoadedState extends HelpState {
  final HelpResponse helpResponse;
  const HelpLoadedState({required this.helpResponse});
}

class HelpErrorState extends HelpState {
  final HelperResponse helperResponse;
  const HelpErrorState({required this.helperResponse});
}
