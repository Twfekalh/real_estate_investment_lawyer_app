import 'package:equatable/equatable.dart';

import 'datum.dart';

class HelpResponse extends Equatable {
  final String? message;
  final List<Help>? data;

  const HelpResponse({this.message, this.data});

  factory HelpResponse.fromJson(Map<String, dynamic> json) => HelpResponse(
    message: json['message'] as String?,
    data:
        (json['data'] as List<dynamic>?)
            ?.map((e) => Help.fromJson(e as Map<String, dynamic>))
            .toList(),
  );

  Map<String, dynamic> toJson() => {
    'message': message,
    'data': data?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [message, data];
}
