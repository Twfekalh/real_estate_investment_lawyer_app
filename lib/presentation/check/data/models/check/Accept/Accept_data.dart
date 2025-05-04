import 'package:equatable/equatable.dart';

class Accept extends Equatable {
  final int? id;
  final int? propertyForSaleId;
  final String? status;
  final String? typeRequest;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Accept({
    this.id,
    this.propertyForSaleId,
    this.status,
    this.typeRequest,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  factory Accept.fromJson(Map<String, dynamic> json) => Accept(
    id: json['id'] as int?,
    propertyForSaleId: json['property_for_sale_id'] as int?,
    status: json['status'] as String?,
    typeRequest: json['type_request'] as String?,
    description: json['description'] as String?,
    createdAt:
        json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
    updatedAt:
        json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'property_for_sale_id': propertyForSaleId,
    'status': status,
    'type_request': typeRequest,
    'description': description,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
  };

  @override
  List<Object?> get props {
    return [
      id,
      propertyForSaleId,
      status,
      typeRequest,
      description,
      createdAt,
      updatedAt,
    ];
  }
}
