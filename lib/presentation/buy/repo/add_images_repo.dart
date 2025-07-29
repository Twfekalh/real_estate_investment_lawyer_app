import 'package:lawyer_app/presentation/buy/presentation/bloc/add_images_event.dart';

abstract class AddImagesRepo {
  Future<dynamic> addImages(SubmitAddImagesEvent event);
}
