import 'package:lawyer_app/presentation/check/presentation/bloc/check_bloc.dart';

abstract class LegalCheckRepo {
  Future acceptRequest(AcceptRequestEvent event);
  Future rejectRequest(RejectRequestEvent event);
}

// abstract class LegalCheckRepo {
//   Future<GetAllRequestsResponse> getAllRequests();

//   Future<AcceptResponse> acceptRequest(int id);

//   Future<SingleRequestResponse> rejectRequest(int id, String reason);
// }
