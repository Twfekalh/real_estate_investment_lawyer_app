import 'dart:convert';

import 'data.dart';

class AddImagesResponse {
  String? message;
  Data? data;

  AddImagesResponse({this.message, this.data});

  factory AddImagesResponse.from(Map<String, dynamic> data) {
    return AddImagesResponse(
      message: data['message'] as String?,
      data:
          data['data'] == null
              ? null
              : Data.fromMessageDataId1RequestFromExpertId1PropertyForSaleId1StatusCompletedTypeRequestBuyRequestFrontImageImagesFront1753023185Screenshot20231223173809PngBackImageImagesBack1753023185Screenshot20231223173809PngCreatedAt20250718T145507000000ZUpdatedAt20250720T145305000000Z(
                data['data'] as Map<String, dynamic>,
              ),
    );
  }

  Map<String, dynamic>
  toMessageDataId1RequestFromExpertId1PropertyForSaleId1StatusCompletedTypeRequestBuyRequestFrontImageImagesFront1753023185Screenshot20231223173809PngBackImageImagesBack1753023185Screenshot20231223173809PngCreatedAt20250718T145507000000ZUpdatedAt20250720T145305000000Z() {
    return {
      'message': message,
      'data':
          data?.toMessageDataId1RequestFromExpertId1PropertyForSaleId1StatusCompletedTypeRequestBuyRequestFrontImageImagesFront1753023185Screenshot20231223173809PngBackImageImagesBack1753023185Screenshot20231223173809PngCreatedAt20250718T145507000000ZUpdatedAt20250720T145305000000Z(),
    };
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AddImagesResponse].
  factory AddImagesResponse.fromJson(String data) {
    return AddImagesResponse.from(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AddImagesResponse] to a JSON string.
  String toJson() => json.encode(
    toMessageDataId1RequestFromExpertId1PropertyForSaleId1StatusCompletedTypeRequestBuyRequestFrontImageImagesFront1753023185Screenshot20231223173809PngBackImageImagesBack1753023185Screenshot20231223173809PngCreatedAt20250718T145507000000ZUpdatedAt20250720T145305000000Z(),
  );
}
