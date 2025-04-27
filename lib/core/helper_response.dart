// lib/core/helper_response.dart
import 'dart:io';
import 'package:dio/dio.dart';
import 'enums.dart';

class HelperResponse {
  final Map<String, dynamic>? fullBody;
  final String response;
  final ServicesResponseStatues servicesResponse;

  HelperResponse({
    this.fullBody,
    required this.response,
    required this.servicesResponse,
  });

  HelperResponse copyWith({
    Map<String, dynamic>? fullBody,
    String? response,
    ServicesResponseStatues? servicesResponse,
  }) => HelperResponse(
    fullBody: fullBody ?? this.fullBody,
    response: response ?? this.response,
    servicesResponse: servicesResponse ?? this.servicesResponse,
  );
}
