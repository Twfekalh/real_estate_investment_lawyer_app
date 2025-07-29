import 'package:dio/dio.dart';
import 'package:lawyer_app/config/api_config.dart';
import 'package:lawyer_app/core/api_service.dart';
import 'package:lawyer_app/core/enums.dart';
import 'package:lawyer_app/core/constant.dart';
import 'package:lawyer_app/presentation/buy/data/models/buy/add_images_response/add_images_response.dart'
    show AddImagesResponse;
import 'package:lawyer_app/presentation/buy/data/models/buy/buy.request.add.images.dart';
import 'package:lawyer_app/presentation/buy/presentation/bloc/add_images_event.dart'
    show SubmitAddImagesEvent;
import 'package:lawyer_app/presentation/buy/repo/add_images_repo.dart';

class AddImagesRepoImpl implements AddImagesRepo {
  final ApiService _apiService;

  AddImagesRepoImpl(this._apiService);

  @override
  Future<dynamic> addImages(SubmitAddImagesEvent event) async {
    final frontImage = await MultipartFile.fromFile(
      event.frontImagePath,
      filename: 'front.jpg',
    );
    final backImage = await MultipartFile.fromFile(
      event.backImagePath,
      filename: 'back.jpg',
    );

    final formData = FormData.fromMap({
      'front_image': frontImage,
      'back_image': backImage,
    });

    final helperResponse = await _apiService.post(
      endpoint: '${ApiConfig.addImageForDocument}/${event.id}',
      token: token,
      data: formData,
      //  isFormData: true,
    );

    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        final response = AddImagesResponse.from(helperResponse.fullBody!);
        return response;
      } catch (e) {
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }

    return helperResponse;
  }
}
