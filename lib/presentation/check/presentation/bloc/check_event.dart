part of 'check_bloc.dart';

/// الأحداث التي يمكن أن تحدث على الـ CheckBloc
sealed class CheckEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// قبول طلب فحص قانوني
class AcceptRequestEvent extends CheckEvent {
  final int requestId;

  AcceptRequestEvent(this.requestId);

  @override
  List<Object?> get props => [requestId];
}

/// رفض طلب فحص قانوني
class RejectRequestEvent extends CheckEvent {
  final int requestId;
  final String reason;

  RejectRequestEvent(this.requestId, this.reason);

  @override
  List<Object?> get props => [requestId, reason];
}
