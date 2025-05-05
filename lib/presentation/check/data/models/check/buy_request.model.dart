// import 'package:equatable/equatable.dart';

// class BuyRequest extends Equatable {
//   final int? id;
//   final String? status;
//   final String? typeRequest;
//   final String? userName;
//   final String? propertyType;
//   final String? location;
//   final String? createdAt;

//   const BuyRequest({
//     this.id,
//     this.status,
//     this.typeRequest,
//     this.userName,
//     this.propertyType,
//     this.location,
//     this.createdAt,
//   });

//   factory BuyRequest.fromJson(Map<String, dynamic> json) => BuyRequest(
//     id: json['id'] as int?,
//     status: json['status'] as String?,
//     typeRequest: json['type_request'] as String?,
//     userName: json['user_name'] as String?,
//     propertyType: json['property_type'] as String?,
//     location: json['location'] as String?,
//     createdAt: json['created_at'] as String?,
//   );

//   Map<String, dynamic> toJson() => {
//     'id': id,
//     'status': status,
//     'type_request': typeRequest,
//     'user_name': userName,
//     'property_type': propertyType,
//     'location': location,
//     'created_at': createdAt,
//   };

//   @override
//   List<Object?> get props {
//     return [
//       id,
//       status,
//       typeRequest,
//       userName,
//       propertyType,
//       location,
//       createdAt,
//     ];
//   }
// }
