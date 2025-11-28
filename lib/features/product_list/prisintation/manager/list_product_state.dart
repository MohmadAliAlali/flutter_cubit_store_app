part of 'list_product_cubit.dart';

abstract class ListProductState {}

class ListInitial extends ListProductState {}

class ListLoading extends ListProductState {}

class ListLoaded extends ListProductState {
  final List<ProductInfoModel> products;

  ListLoaded({required this.products});

  ListLoaded copyWith({
    List<ProductInfoModel>? products,
  }) {
    return ListLoaded(
      products: products ?? this.products,
    );
  }
}

class ListError extends ListProductState {
  final String message;

  ListError(this.message);
}
