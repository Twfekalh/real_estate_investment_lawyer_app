part of 'check_proparty_bloc.dart';

abstract class CheckPropertyEvent {
  const CheckPropertyEvent();
}

class FetchCheckPropertyByIdEvent extends CheckPropertyEvent {
  final int id;

  FetchCheckPropertyByIdEvent(this.id);
}
