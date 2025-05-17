import 'package:equatable/equatable.dart';

class CheckProperty extends Equatable {
  final int? id;
  final int? userId;
  final String? propertyType;
  final String? area;
  final int? numberOfRooms;
  final int? numberOfBathrooms;
  final int? propertyAge;
  final String? decoration;
  final String? kitchenType;
  final String? flooringType;
  final int? overlookFrom;
  final String? balconySize;
  final String? paintingType;
  final String? price;
  final String? payWay;
  final String? state;
  final String? exactPosition;
  final String? contract;
  final int? legalCheck;
  final int? expertCheck;
  final int? accept;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const CheckProperty({
    this.id,
    this.userId,
    this.propertyType,
    this.area,
    this.numberOfRooms,
    this.numberOfBathrooms,
    this.propertyAge,
    this.decoration,
    this.kitchenType,
    this.flooringType,
    this.overlookFrom,
    this.balconySize,
    this.paintingType,
    this.price,
    this.payWay,
    this.state,
    this.exactPosition,
    this.contract,
    this.legalCheck,
    this.expertCheck,
    this.accept,
    this.createdAt,
    this.updatedAt,
  });

  factory CheckProperty.fromJson(Map<String, dynamic> json) => CheckProperty(
    id: json['id'] as int?,
    userId: json['user_id'] as int?,
    propertyType: json['property_type'] as String?,
    area: json['area'] as String?,
    numberOfRooms: json['number_of_rooms'] as int?,
    numberOfBathrooms: json['number_of_bathrooms'] as int?,
    propertyAge: json['property_age'] as int?,
    decoration: json['decoration'] as String?,
    kitchenType: json['kitchen_type'] as String?,
    flooringType: json['flooring_type'] as String?,
    overlookFrom: json['overlook_from'] as int?,
    balconySize: json['balcony_size'] as String?,
    paintingType: json['painting_type'] as String?,
    price: json['price'] as String?,
    payWay: json['pay_way'] as String?,
    state: json['state'] as String?,
    exactPosition: json['exact_position'] as String?,
    contract: json['contract'] as String?,
    legalCheck: json['legal_check'] as int?,
    expertCheck: json['expert_check'] as int?,
    accept: json['accept'] as int?,
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
    'user_id': userId,
    'property_type': propertyType,
    'area': area,
    'number_of_rooms': numberOfRooms,
    'number_of_bathrooms': numberOfBathrooms,
    'property_age': propertyAge,
    'decoration': decoration,
    'kitchen_type': kitchenType,
    'flooring_type': flooringType,
    'overlook_from': overlookFrom,
    'balcony_size': balconySize,
    'painting_type': paintingType,
    'price': price,
    'pay_way': payWay,
    'state': state,
    'exact_position': exactPosition,
    'contract': contract,
    'legal_check': legalCheck,
    'expert_check': expertCheck,
    'accept': accept,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
  };

  @override
  List<Object?> get props {
    return [
      id,
      userId,
      propertyType,
      area,
      numberOfRooms,
      numberOfBathrooms,
      propertyAge,
      decoration,
      kitchenType,
      flooringType,
      overlookFrom,
      balconySize,
      paintingType,
      price,
      payWay,
      state,
      exactPosition,
      contract,
      legalCheck,
      expertCheck,
      accept,
      createdAt,
      updatedAt,
    ];
  }
}
