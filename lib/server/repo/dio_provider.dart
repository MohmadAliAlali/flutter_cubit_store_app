// lib/core/network/dio_provider.dart
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:task1_cubit/core/storage/hive_manager.dart';
import 'package:task1_cubit/server/constans.dart';

Dio buildDio() {
  final dio = Dio()
    ..options = BaseOptions(
      baseUrl: AppLinks.baseUrl,
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    );

  dio.interceptors.addAll([
    if (!AppLinks.useMock) PrettyDioLogger(requestBody: true, responseBody: true),
    if (AppLinks.useMock) _MockInterceptor(), // فقط عند التجريب
    _AuthInterceptor(), // توكن / Refresh إن وجد
  ]);

  return dio;
}

/* ---------- Interceptor للـ Mock ---------- */
class _MockInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler h) async {
    if (!AppLinks.useMock) return h.next(options);

    if (options.path.contains('/users')) {
      final jsonString = await rootBundle.loadString('assets/mock_data/users.json');
      return h.resolve(
        Response(
          requestOptions: options,
          data: jsonDecode(jsonString),
          statusCode: 200,
        ),
      );
    }
    return h.reject(
      DioException(requestOptions: options, error: 'Mock route not found'),
    );
  }
}

class _AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler h) async {
    final token = HiveManager.getToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    h.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler h) async {
    if (err.response?.statusCode == 401) {
      HiveManager.deleteToken(); // تسجيل خروج تلقائي
      // يمكنك توجيه المستخدم للـ Login هنا
    }
    h.next(err);
  }
}