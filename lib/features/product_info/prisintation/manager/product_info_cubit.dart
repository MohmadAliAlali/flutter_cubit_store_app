import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1_cubit/features/product_info/data/product_info_model.dart';
import 'product_info_state.dart';

class ProductInfoCubit extends Cubit<ProductInfoState> {
  ProductInfoCubit() : super(ProductInfoInitial());

  ProductInfoModel? currentProduct;

  // void setProduct(ProductInfoModel product) {
  //   currentProduct = product;
  //   emit(ProductInfoLoaded(product));
  // }late ProductInfoModel product; // نخزنه هنا
  late ProductInfoModel product; // نخزنه هنا

  void setProduct(ProductInfoModel p) {
    product = p;
  }

  Future<void> loadProduct() async {
    emit(ProductInfoLoading());

    await Future.delayed(const Duration(milliseconds: 500));

    emit(ProductInfoLoaded(product));
  }

  Future<void> loadProductInfo(ProductInfoModel product) async {
    emit(ProductInfoLoading());

    await Future.delayed(const Duration(milliseconds: 500));

    emit(ProductInfoLoaded(product));
  }
}
