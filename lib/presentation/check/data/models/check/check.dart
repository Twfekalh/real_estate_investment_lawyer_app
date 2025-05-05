// import 'package:equatable/equatable.dart';

// import 'buy_request.model.dart';
// import 'legal_check.model.dart';

// class Check extends Equatable {
//   final List<LegalCheck>? legalCheck;
//   final List<BuyRequest>? buyRequests;

//   const Check({this.legalCheck, this.buyRequests});

//   factory Check.fromJson(Map<String, dynamic> json) => Check(
//     legalCheck:
//         (json['legal check'] as List<dynamic>?)
//             ?.map((e) => LegalCheck.fromJson(e as Map<String, dynamic>))
//             .toList(),
//     buyRequests:
//         (json['buy requests'] as List<dynamic>?)
//             ?.map((e) => BuyRequest.fromJson(e as Map<String, dynamic>))
//             .toList(),
//   );

//   Map<String, dynamic> toJson() => {
//     'legal check': legalCheck?.map((e) => e.toJson()).toList(),
//     'buy requests': buyRequests?.map((e) => e.toJson()).toList(),
//   };

//   @override
//   List<Object?> get props => [legalCheck, buyRequests];
// }
