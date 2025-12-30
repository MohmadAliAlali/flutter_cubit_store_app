import 'package:dio/dio.dart';
import 'package:task1_cubit/server/repo/dio_provider.dart';

class RegiserRepo {
  late final Dio _dio = buildDio();

  Future<dynamic> register({
    required String email,
    required String name,
    required String password,
  }) async => (await _dio.post(
    '/register',
    data: {'email': email, 'name': name, 'password': password},
  )).data;
}
