import 'package:equatable/equatable.dart';

class Data extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final dynamic emailVerifiedAt;
  final String? phone;
  final dynamic verificationCode;
  final int? roleId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Data({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.phone,
    this.verificationCode,
    this.roleId,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json['id'] as int?,
    name: json['name'] as String?,
    email: json['email'] as String?,
    emailVerifiedAt: json['email_verified_at'] as dynamic,
    phone: json['phone'] as String?,
    verificationCode: json['verification_code'] as dynamic,
    roleId: json['role_id'] as int?,
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
    'email': email,
    'email_verified_at': emailVerifiedAt,
    'phone': phone,
    'verification_code': verificationCode,
    'role_id': roleId,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
  };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      email,
      emailVerifiedAt,
      phone,
      verificationCode,
      roleId,
      createdAt,
      updatedAt,
    ];
  }
}
