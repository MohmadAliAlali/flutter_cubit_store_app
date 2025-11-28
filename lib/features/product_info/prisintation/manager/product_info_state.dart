import 'package:task1_cubit/features/product_info/data/product_info_model.dart';

abstract class ProductInfoState {}

class ProductInfoInitial extends ProductInfoState {}

class ProductInfoLoading extends ProductInfoState {}

class ProductInfoLoaded extends ProductInfoState {
  final ProductInfoModel product;

  ProductInfoLoaded(this.product);
}

class ProductInfoError extends ProductInfoState {
  final String message;

  ProductInfoError(this.message);
}
