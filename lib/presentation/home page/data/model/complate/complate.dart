import 'package:equatable/equatable.dart';

import 'datum.dart';

class ComplateResponse extends Equatable {
  final String? message;
  final List<Complate>? data;

  const ComplateResponse({this.message, this.data});

  factory ComplateResponse.fromJson(Map<String, dynamic> json) =>
      ComplateResponse(
        message: json['message'] as String?,
        data:
            (json['data'] as List<dynamic>?)
                ?.map((e) => Complate.fromJson(e as Map<String, dynamic>))
                .toList(),
      );

  Map<String, dynamic> toJson() => {
    'message': message,
    'data': data?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [message, data];
}
