import 'package:dio/dio.dart';
import 'dio_provider.dart';
class ApiService {
  late final Dio _dio = buildDio();

  Future<List<dynamic>> getUsers() async {
    final response = await _dio.get('/users');
    return response.data as List<dynamic>;
  }

  
}