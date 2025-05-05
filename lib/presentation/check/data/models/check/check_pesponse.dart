// import 'package:equatable/equatable.dart';

// import 'check.dart';

// class CheckResponse extends Equatable {
//   final String? message;
//   final Check? data;

//   const CheckResponse({this.message, this.data});

//   factory CheckResponse.fromJson(Map<String, dynamic> json) => CheckResponse(
//     message: json['message'] as String?,
//     data:
//         json['data'] == null
//             ? null
//             : Check.fromJson(json['data'] as Map<String, dynamic>),
//   );

//   Map<String, dynamic> toJson() => {'message': message, 'data': data?.toJson()};

//   @override
//   List<Object?> get props => [message, data];
// }
