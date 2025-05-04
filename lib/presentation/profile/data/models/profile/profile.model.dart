import 'package:equatable/equatable.dart';

import 'data.model.dart';

class ProfileResponse extends Equatable {
  final String? message;
  final UserProfile? data;

  const ProfileResponse({this.message, this.data});

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      ProfileResponse(
        message: json['message'] as String?,
        data:
            json['data'] == null
                ? null
                : UserProfile.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {'message': message, 'data': data?.toJson()};

  @override
  List<Object?> get props => [message, data];
}
