part of 'check_bloc.dart';

@immutable
sealed class CheckEvent {}

/// Load all legal-check and buy-request items
class GetAllRequestsEvent extends CheckEvent {
  @override
  List<Object?> get props => [];
}

/// Accept a specific legal-check request
class AcceptRequestEvent extends CheckEvent {
  final int requestId;
  AcceptRequestEvent(this.requestId);

  @override
  List<Object?> get props => [requestId];
}

/// Reject a specific legal-check request with a reason
class RejectRequestEvent extends CheckEvent {
  final int requestId;
  final String reason;
  RejectRequestEvent(this.requestId, this.reason);

  @override
  List<Object?> get props => [requestId, reason];
}
