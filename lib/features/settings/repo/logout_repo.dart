import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:task1_cubit/core/storage/hive_manager.dart';
import 'package:task1_cubit/server/repo/dio_provider.dart';

class LogoutRepo {
  late final Dio _dio = buildDio();

  Future logout() async {
    final respons = (await _dio.post('/logout'));
    if (respons.statusCode == 200) {
      HiveManager.deleteToken();
      return true;
    }
    return false;
  }
}
