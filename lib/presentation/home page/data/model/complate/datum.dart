import 'package:equatable/equatable.dart';

import 'property.dart';

class Complate extends Equatable {
  final int? id;
  final String? status;
  final String? typeRequest;
  final Property? property;

  const Complate({this.id, this.status, this.typeRequest, this.property});

  factory Complate.fromJson(Map<String, dynamic> json) => Complate(
    id: json['id'] as int?,
    status: json['status'] as String?,
    typeRequest: json['type_request'] as String?,
    property:
        json['property'] == null
            ? null
            : Property.fromJson(json['property'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'status': status,
    'type_request': typeRequest,
    'property': property?.toJson(),
  };

  @override
  List<Object?> get props => [id, status, typeRequest, property];
}
