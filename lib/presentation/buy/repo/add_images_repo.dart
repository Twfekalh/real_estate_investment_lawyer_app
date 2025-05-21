import 'package:lawyer_app/presentation/buy/presentation/bloc/add_images_event.dart';

abstract class AddImagesRepo {
  /// يرسل الصور الأمامية والخلفية لعقار معين حسب المعرف
  Future<dynamic> addImages(SubmitAddImagesEvent event);
}
