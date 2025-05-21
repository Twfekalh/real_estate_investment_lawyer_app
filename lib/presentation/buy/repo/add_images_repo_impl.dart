import 'package:lawyer_app/config/api_config.dart';
import 'package:lawyer_app/core/api_service.dart';
import 'package:lawyer_app/core/enums.dart';
import 'package:lawyer_app/core/constant.dart';
import 'package:lawyer_app/presentation/buy/data/models/buy/buy.request.add.images.dart';
import 'package:lawyer_app/presentation/buy/presentation/bloc/add_images_event.dart'
    show SubmitAddImagesEvent;
import 'package:lawyer_app/presentation/buy/repo/add_images_repo.dart';

class AddImagesRepoImpl implements AddImagesRepo {
  final ApiService _apiService;

  AddImagesRepoImpl(this._apiService);

  @override
  Future<dynamic> addImages(SubmitAddImagesEvent event) async {
    final helperResponse = await _apiService.post(
      endpoint: '${ApiConfig.addImageForDocument}/${event.id}',
      token: token,
      data: {
        'front_image': event.frontImagePath,
        'back_image': event.backImagePath,
      },
    );

    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        final response = AddImagesResponse.fromJson(helperResponse.fullBody!);
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
