import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:task1_cubit/server/repo/api_service.dart';
import 'package:task1_cubit/server/repo/dio_provider.dart';
import 'package:task1_cubit/core/storage/hive_manager.dart';

class LoginRepo extends ApiService {
  late final Dio _dio = buildDio();
  Future<dynamic> loginUser(String email, String pass) async {
    var response = await _dio.post(
      '/login',
      data: {'email': email, 'password': pass},
    );
    if (response.statusCode == 200) {
      // print(response);
      var data = response.data;
      // print(data);
      HiveManager.saveToken(data['token']);
      return data;
      // print(HiveManager.getToken());
    }
    return response;
  }
}
