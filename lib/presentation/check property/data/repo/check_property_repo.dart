import 'package:lawyer_app/presentation/check%20property/presentation/bloc/check_proparty_bloc.dart';

/// الواجهة المجردة للمستودع
abstract class CheckPropertyRepo {
  /// يجلب بيانات عقار واحد حسب المعرف
  Future<dynamic> fetchPropertyById(FetchCheckPropertyByIdEvent event);
}
