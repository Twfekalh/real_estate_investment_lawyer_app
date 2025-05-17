import 'package:equatable/equatable.dart';

import 'data.property.dart';

class CheckPropertyResponse extends Equatable {
  final String? message;
  final CheckProperty? data;

  const CheckPropertyResponse({this.message, this.data});

  factory CheckPropertyResponse.fromJson(Map<String, dynamic> json) =>
      CheckPropertyResponse(
        message: json['message'] as String?,
        data:
            json['data'] == null
                ? null
                : CheckProperty.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {'message': message, 'data': data?.toJson()};

  @override
  List<Object?> get props => [message, data];
}
