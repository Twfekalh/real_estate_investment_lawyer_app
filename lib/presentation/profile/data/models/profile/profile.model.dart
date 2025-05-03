import 'package:equatable/equatable.dart';

import 'data.model.dart';

class Profile extends Equatable {
  final String? message;
  final Data? data;

  const Profile({this.message, this.data});

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    message: json['message'] as String?,
    data:
        json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {'message': message, 'data': data?.toJson()};

  @override
  List<Object?> get props => [message, data];
}
