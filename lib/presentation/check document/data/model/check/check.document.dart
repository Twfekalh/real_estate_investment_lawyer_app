import 'package:equatable/equatable.dart';

import 'data.document.dart';

class CheckDocumentResponse extends Equatable {
  final String? message;
  final CheckDocument? data;

  const CheckDocumentResponse({this.message, this.data});

  factory CheckDocumentResponse.fromJson(Map<String, dynamic> json) =>
      CheckDocumentResponse(
        message: json['message'] as String?,
        data:
            json['data'] == null
                ? null
                : CheckDocument.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {'message': message, 'data': data?.toJson()};

  @override
  List<Object?> get props => [message, data];
}
