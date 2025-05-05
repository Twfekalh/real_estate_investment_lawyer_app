// import 'package:equatable/equatable.dart';

// import 'reject.dart';

// class RejectResponse extends Equatable {
//   final String? message;
//   final Reject? data;

//   const RejectResponse({this.message, this.data});

//   factory RejectResponse.fromJson(Map<String, dynamic> json) => RejectResponse(
//     message: json['message'] as String?,
//     data:
//         json['data'] == null
//             ? null
//             : Reject.fromJson(json['data'] as Map<String, dynamic>),
//   );

//   Map<String, dynamic> toJson() => {'message': message, 'data': data?.toJson()};

//   @override
//   List<Object?> get props => [message, data];
// }
