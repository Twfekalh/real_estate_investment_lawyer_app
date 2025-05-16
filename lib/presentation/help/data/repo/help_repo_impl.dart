import 'package:lawyer_app/config/api_config.dart';
import 'package:lawyer_app/core/api_service.dart';
import 'package:lawyer_app/core/enums.dart';
import 'package:lawyer_app/presentation/help/data/models/help.dart';
import 'package:lawyer_app/presentation/help/data/repo/help_repo.dart';
import 'package:lawyer_app/presentation/help/presentation/bloc/help_bloc.dart'
    show FetchFrequentlyQuestionsEvent;

class HelpRepoImpl implements HelpRepo {
  final ApiService _apiService;

  HelpRepoImpl(this._apiService);

  @override
  Future<dynamic> getFrequentlyQuestions(
    FetchFrequentlyQuestionsEvent event,
  ) async {
    // نرسل طلب GET إلى مسار الأسئلة الشائعة
    final helperResponse = await _apiService.get(
      endpoint: ApiConfig.getFrequentlyQuestions,
      //token: token,
    );

    // إذا كان الاستدعاء ناجحاً
    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        // نُحلّل الـ JSON إلى HelpResponse
        final helpResponse = HelpResponse.fromJson(helperResponse.fullBody!);
        return helpResponse;
      } catch (e) {
        // خطأ parsing
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }

    // في حال فشل الشبكة أو غيره، نعيد الـ HelperResponse كما هو
    return helperResponse;
  }
}
