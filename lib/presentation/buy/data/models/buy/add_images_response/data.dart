import 'dart:convert';

class Data {
	int? id;
	int? requestFromExpertId;
	int? propertyForSaleId;
	String? status;
	String? typeRequest;
	String? frontImage;
	String? backImage;
	DateTime? createdAt;
	DateTime? updatedAt;

	Data({
		this.id, 
		this.requestFromExpertId, 
		this.propertyForSaleId, 
		this.status, 
		this.typeRequest, 
		this.frontImage, 
		this.backImage, 
		this.createdAt, 
		this.updatedAt, 
	});

	factory Data.fromMessageDataId1RequestFromExpertId1PropertyForSaleId1StatusCompletedTypeRequestBuyRequestFrontImageImagesFront1753023185Screenshot20231223173809PngBackImageImagesBack1753023185Screenshot20231223173809PngCreatedAt20250718T145507000000ZUpdatedAt20250720T145305000000Z(Map<String, dynamic> data) {
		return Data(
			id: data['id'] as int?,
			requestFromExpertId: data['request_from_expert_id'] as int?,
			propertyForSaleId: data['property_for_sale_id'] as int?,
			status: data['status'] as String?,
			typeRequest: data['type_request'] as String?,
			frontImage: data['front_image'] as String?,
			backImage: data['back_image'] as String?,
			createdAt: data['created_at'] == null
						? null
						: DateTime.parse(data['created_at'] as String),
			updatedAt: data['updated_at'] == null
						? null
						: DateTime.parse(data['updated_at'] as String),
		);
	}



	Map<String, dynamic> toMessageDataId1RequestFromExpertId1PropertyForSaleId1StatusCompletedTypeRequestBuyRequestFrontImageImagesFront1753023185Screenshot20231223173809PngBackImageImagesBack1753023185Screenshot20231223173809PngCreatedAt20250718T145507000000ZUpdatedAt20250720T145305000000Z() {
		return {
			'id': id,
			'request_from_expert_id': requestFromExpertId,
			'property_for_sale_id': propertyForSaleId,
			'status': status,
			'type_request': typeRequest,
			'front_image': frontImage,
			'back_image': backImage,
			'created_at': createdAt?.toIso8601String(),
			'updated_at': updatedAt?.toIso8601String(),		};
	}

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Data].
	factory Data.fromJson(String data) {
		return Data.fromMessageDataId1RequestFromExpertId1PropertyForSaleId1StatusCompletedTypeRequestBuyRequestFrontImageImagesFront1753023185Screenshot20231223173809PngBackImageImagesBack1753023185Screenshot20231223173809PngCreatedAt20250718T145507000000ZUpdatedAt20250720T145305000000Z(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Data] to a JSON string.
	String toJson() => json.encode(toMessageDataId1RequestFromExpertId1PropertyForSaleId1StatusCompletedTypeRequestBuyRequestFrontImageImagesFront1753023185Screenshot20231223173809PngBackImageImagesBack1753023185Screenshot20231223173809PngCreatedAt20250718T145507000000ZUpdatedAt20250720T145305000000Z());
}
