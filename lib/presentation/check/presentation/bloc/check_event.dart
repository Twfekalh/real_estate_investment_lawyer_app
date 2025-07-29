part of 'check_bloc.dart';

sealed class CheckEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AcceptRequestEvent extends CheckEvent {
  final int requestId;

  AcceptRequestEvent(this.requestId);

  @override
  List<Object?> get props => [requestId];
}

class RejectRequestEvent extends CheckEvent {
  final int requestId;
  final String reason;

  RejectRequestEvent(this.requestId, this.reason);

  @override
  List<Object?> get props => [requestId, reason];
}
