import 'package:equatable/equatable.dart';

class LegalCheck extends Equatable {
  final int? id;
  final String? status;
  final String? description;
  final String? userName;
  final String? propertyType;
  final String? location;
  final String? createdAt;

  const LegalCheck({
    this.id,
    this.status,
    this.description,
    this.userName,
    this.propertyType,
    this.location,
    this.createdAt,
  });

  factory LegalCheck.fromJson(Map<String, dynamic> json) => LegalCheck(
    id: json['id'] as int?,
    status: json['status'] as String?,
    description: json['description'] as String?,
    userName: json['user_name'] as String?,
    propertyType: json['property_type'] as String?,
    location: json['location'] as String?,
    createdAt: json['created_at'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'status': status,
    'description': description,
    'user_name': userName,
    'property_type': propertyType,
    'location': location,
    'created_at': createdAt,
  };

  @override
  List<Object?> get props {
    return [
      id,
      status,
      description,
      userName,
      propertyType,
      location,
      createdAt,
    ];
  }
}
