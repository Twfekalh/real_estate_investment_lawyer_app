import 'package:equatable/equatable.dart';

import 'data.request.add.images.dart';

class AddImagesResponse extends Equatable {
  final String? message;
  final AddImages? data;

  const AddImagesResponse({this.message, this.data});

  factory AddImagesResponse.fromJson(Map<String, dynamic> json) =>
      AddImagesResponse(
        message: json['message'] as String?,
        data:
            json['data'] == null
                ? null
                : AddImages.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {'message': message, 'data': data?.toJson()};

  @override
  List<Object?> get props => [message, data];
}
