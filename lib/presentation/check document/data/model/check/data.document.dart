import 'package:equatable/equatable.dart';

import 'id_image.document.dart';
import 'property_document.document.dart';
import 'property_image.document.dart';

class CheckDocument extends Equatable {
  final List<PropertyImage>? propertyImage;
  final List<PropertyDocument>? propertyDocument;
  final List<IdImage>? idImages;

  const CheckDocument({
    this.propertyImage,
    this.propertyDocument,
    this.idImages,
  });

  factory CheckDocument.fromJson(Map<String, dynamic> json) => CheckDocument(
    propertyImage:
        (json['Property_image'] as List<dynamic>?)
            ?.map((e) => PropertyImage.fromJson(e as Map<String, dynamic>))
            .toList(),
    propertyDocument:
        (json['Property_document'] as List<dynamic>?)
            ?.map((e) => PropertyDocument.fromJson(e as Map<String, dynamic>))
            .toList(),
    idImages:
        (json['id_images'] as List<dynamic>?)
            ?.map((e) => IdImage.fromJson(e as Map<String, dynamic>))
            .toList(),
  );

  Map<String, dynamic> toJson() => {
    'Property_image': propertyImage?.map((e) => e.toJson()).toList(),
    'Property_document': propertyDocument?.map((e) => e.toJson()).toList(),
    'id_images': idImages?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [propertyImage, propertyDocument, idImages];
}
