part of 'deputizations_bloc.dart';

sealed class DeputizationsEvent extends Equatable {
  const DeputizationsEvent();

  @override
  List<Object> get props => [];
}

class GetDeputizationsEvent extends DeputizationsEvent {
  final bool refresh;

  const GetDeputizationsEvent({this.refresh = false});
}

class ProccessDeputazationEvent  extends DeputizationsEvent {
  final String id;

  ProccessDeputazationEvent({required this.id});
}
