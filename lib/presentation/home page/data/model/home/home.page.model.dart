// import 'package:equatable/equatable.dart';

// import 'data.page.model.dart';

// class HomeResponse extends Equatable {
//   final String? message;
//   final Home? data;

//   const HomeResponse({this.message, this.data});

//   factory HomeResponse.fromJson(Map<String, dynamic> json) => HomeResponse(
//     message: json['message'] as String?,
//     data:
//         json['data'] == null
//             ? null
//             : Home.fromJson(json['data'] as Map<String, dynamic>),
//   );

//   Map<String, dynamic> toJson() => {'message': message, 'data': data?.toJson()};

//   @override
//   List<Object?> get props => [message, data];
// }
import 'dart:convert';
import 'data.page.model.dart';

class HomeResponse {
  final String? message;
  final Home? data;

  const HomeResponse({this.message, this.data});

  factory HomeResponse.from(Map<String, dynamic> json) {
    return HomeResponse(
      message: json['message'] as String?,
      data:
          json['data'] == null
              ? null
              : Home.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() {
    return {'message': message, 'data': data?.toJson()};
  }

  factory HomeResponse.fromJson(String source) {
    return HomeResponse.from(json.decode(source) as Map<String, dynamic>);
  }

  /// Converts the object to a JSON string.
  String toJson() => json.encode(toMap());
}
