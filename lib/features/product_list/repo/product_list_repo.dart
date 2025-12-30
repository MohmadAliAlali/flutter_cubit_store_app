

// import 'package:dio/dio.dart';
// import 'package:task1_cubit/features/product_info/data/product_info_model.dart';
// import 'package:task1_cubit/server/repo/dio_provider.dart';

// class ProductListRepo {
//     late final Dio _dio = buildDio();
// Future<List<ProductInfoModel>> productList() async {
//     var response = await _dio.post(
//       '/login',
//       data: {'email': email, 'password': pass},
//     );
//     // if (response.statusCode == 200) {
//     //   // print(response);
//     //   var data = response.data;
//     //   print(data);
//     //   HiveManager.saveToken(data['token']);
//     //   print(HiveManager.getToken());
//     // }
//     return response;
//   }
// }