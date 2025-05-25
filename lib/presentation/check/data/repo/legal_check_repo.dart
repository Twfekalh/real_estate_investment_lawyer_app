import 'package:lawyer_app/presentation/check/presentation/bloc/check_bloc.dart';

abstract class LegalCheckRepo {
  Future acceptRequest(AcceptRequestEvent event);
  Future rejectRequest(RejectRequestEvent event);
}
