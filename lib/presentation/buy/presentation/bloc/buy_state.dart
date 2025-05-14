// part of 'check_bloc.dart';

// /// الحالة العامة للأحداث
// sealed class BuyState {}

// /// الحالة الأولية عند تشغيل الـ BLoC
// final class BuyInitial extends BuyState {}

// /// الحالة التي تظهر أثناء تحميل البيانات
// final class BuyInLoadingState extends BuyState {}

// /// الحالة التي تظهر إذا فشل الطلب لأي سبب
// final class CheckLoadingFailure extends BuyState {
//   final HelperResponse helperResponse;

//   CheckLoadingFailure({required this.helperResponse});
// }

// /// الحالة عند نجاح قبول الطلب
// final class AcceptDoneState extends BuyState {
//   final AcceptResponse acceptResponse;

//   AcceptDoneState({required this.acceptResponse});
// }

// /// الحالة عند نجاح رفض الطلب
// final class RejectDoneState extends BuyState {
//   final RejectResponse rejectResponse;

//   RejectDoneState({required this.rejectResponse});
// }
