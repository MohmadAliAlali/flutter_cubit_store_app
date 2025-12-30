import 'package:dio/dio.dart';
import 'package:task1_cubit/core/storage/hive_manager.dart';
import 'package:task1_cubit/features/register/data/local/user_local_storage.dart';
import 'package:task1_cubit/server/repo/dio_provider.dart';

class DeleteRepo {
  final Dio _dio = buildDio();
  UserLocalStorage user   = UserLocalStorage();
  Future<Response> deleteAcount() async {
    try {
      Response response = await _dio.delete(
        '/users/${user.getUser()?['id']}',
      );
      if( response.statusCode == 200) {
        HiveManager.deleteToken();
        await user.clearUser();
      }
      return response;
    } catch (e) {
      rethrow;
    }
  }
}