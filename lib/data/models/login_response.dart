// lib/data/models/login_response.dart

class LoginResponse {
  final String message;
  final LoginData data;
  final String token;

  LoginResponse({
    required this.message,
    required this.data,
    required this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      message: json['message'] as String,
      data: LoginData.fromJson(json['data'] as Map<String, dynamic>),
      token: json['token'] as String,
    );
  }
}

class LoginData {
  final int id;
  final String name;
  final String email;
  // أضف الحقول الأخرى إن وُجدت

  LoginData({required this.id, required this.name, required this.email});

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
    );
  }
}
