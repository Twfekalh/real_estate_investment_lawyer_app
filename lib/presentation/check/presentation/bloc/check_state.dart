part of 'check_bloc.dart';

/// الحالة العامة للأحداث
sealed class CheckState {}

/// الحالة الأولية عند تشغيل الـ BLoC
final class CheckInitial extends CheckState {}

/// الحالة التي تظهر أثناء تحميل البيانات
final class CheckInLoadingState extends CheckState {}

/// الحالة التي تظهر إذا فشل الطلب لأي سبب
final class CheckLoadingFailure extends CheckState {
  final HelperResponse helperResponse;

  CheckLoadingFailure({required this.helperResponse});
}

/// الحالة عند نجاح قبول الطلب
final class AcceptDoneState extends CheckState {
  final AcceptResponse acceptResponse;

  AcceptDoneState({required this.acceptResponse});
}

/// الحالة عند نجاح رفض الطلب
final class RejectDoneState extends CheckState {
  final RejectResponse rejectResponse;

  RejectDoneState({required this.rejectResponse});
}
