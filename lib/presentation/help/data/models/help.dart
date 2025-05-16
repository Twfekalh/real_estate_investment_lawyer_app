import 'package:equatable/equatable.dart';

class HelpResponse extends Equatable {
  final String? message;
  final List<dynamic>? data;

  const HelpResponse({this.message, this.data});

  factory HelpResponse.fromJson(Map<String, dynamic> json) => HelpResponse(
    message: json['message'] as String?,
    data: json['data'] as List<dynamic>?,
  );

  Map<String, dynamic> toJson() => {'message': message, 'data': data};

  @override
  List<Object?> get props => [message, data];
}
