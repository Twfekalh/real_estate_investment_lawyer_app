import 'dart:io';
import 'package:dio/dio.dart';
import '../config/api_config.dart';
import 'helper_response.dart';
import 'enums.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiConfig.baseUrl,
      sendTimeout: Duration(seconds: ApiConfig.timeout),
      receiveTimeout: Duration(seconds: ApiConfig.timeout),
    ),
  );

  Future<HelperResponse> post({
    required String endpoint,
    dynamic data,
    String? token,
  }) async {
    _dio.options.headers = {
      'Authorization': token != null ? 'Bearer $token' : null,
      'Accept': 'application/json',
      if (data is! FormData) 'Content-Type': 'application/json',
    };

    try {
      final resp = await _dio.post(endpoint, data: data);
      return HelperResponse(
        fullBody: resp.data as Map<String, dynamic>?,
        response: resp.data.toString(),
        servicesResponse: ServicesResponseStatues.success,
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return HelperResponse(
          fullBody: e.response?.data,
          response: e.response?.data['message'] ?? 'Unauthorized',
          servicesResponse: ServicesResponseStatues.unauthorized,
        );
      }
      return HelperResponse(
        fullBody: e.response?.data,
        response: e.response?.data?['error'] ?? 'Something went wrong',
        servicesResponse: ServicesResponseStatues.someThingWrong,
      );
    } on SocketException {
      return HelperResponse(
        fullBody: null,
        response: 'No internet connection',
        servicesResponse: ServicesResponseStatues.networkError,
      );
    }
  }

  // مماثل للدوال get, put, delete…
}
