import 'package:equatable/equatable.dart';

class PropertyImage extends Equatable {
  final int? id;
  final String? name;
  final String? path;
  final int? propertyForSaleId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const PropertyImage({
    this.id,
    this.name,
    this.path,
    this.propertyForSaleId,
    this.createdAt,
    this.updatedAt,
  });

  factory PropertyImage.fromJson(Map<String, dynamic> json) => PropertyImage(
    id: json['id'] as int?,
    name: json['name'] as String?,
    path: json['path'] as String?,
    propertyForSaleId: json['property_for_sale_id'] as int?,
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
    'name': name,
    'path': path,
    'property_for_sale_id': propertyForSaleId,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
  };

  @override
  List<Object?> get props {
    return [id, name, path, propertyForSaleId, createdAt, updatedAt];
  }
}
