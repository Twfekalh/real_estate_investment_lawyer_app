import 'package:equatable/equatable.dart';

import 'data.page.model.dart';

class HomeResponse extends Equatable {
  final String? message;
  final Home? data;

  const HomeResponse({this.message, this.data});

  factory HomeResponse.fromJson(Map<String, dynamic> json) => HomeResponse(
    message: json['message'] as String?,
    data:
        json['data'] == null
            ? null
            : Home.fromJson(json['data'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {'message': message, 'data': data?.toJson()};

  @override
  List<Object?> get props => [message, data];
}
