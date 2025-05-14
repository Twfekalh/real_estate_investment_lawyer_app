import 'package:equatable/equatable.dart';

import 'Accept_data.dart';

class AcceptResponse extends Equatable {
  final String? message;
  final Accept? data;

  const AcceptResponse({this.message, this.data});

  factory AcceptResponse.fromJson(Map<String, dynamic> json) => AcceptResponse(
    message: json['message'] as String?,
    data:
        json['data'] == null
            ? null
            : Accept.fromJson(json['data'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {'message': message, 'data': data?.toJson()};

  @override
  List<Object?> get props => [message, data];
}
