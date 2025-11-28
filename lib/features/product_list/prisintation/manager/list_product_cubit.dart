import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1_cubit/features/product_info/data/product_info_model.dart';

part 'list_product_state.dart';

class ListCubit extends Cubit<ListProductState> {
  ListCubit() : super(ListInitial());

  Future<void> loadListContent() async {
    try {
      emit(ListLoading());

      await Future.delayed(const Duration(milliseconds: 900));

      final List<ProductInfoModel> productList = [
        ProductInfoModel(
          title: "Pizza Margherita",
          price: 12.99,
          image: "assets/mock_data/profile.png",
          description:
              "Classic Italian pizza with tomato sauce and mozzarella cheese.",
        ),
        ProductInfoModel(
          title: "Cheese Burger",
          price: 9.50,
          image: "assets/mock_data/profile.png",
          description: "Beef burger with melted cheese, lettuce, and tomato.",
        ),
        ProductInfoModel(
          title: "Creamy Pasta",
          price: 14.25,
          image: "assets/mock_data/profile.png",
          description: "Creamy Alfredo pasta with grilled chicken.",
        ),
        ProductInfoModel(
          title: "Fried Chicken",
          price: 11.75,
          image: "aassets/mock_data/profile.png",
          description: "Crispy fried chicken with special seasoning.",
        ),
        ProductInfoModel(
          title: "Mexican Tacos",
          price: 10.00,
          image: "assets/mock_data/profile.png",
          description: "Soft tacos filled with beef, cheese, and vegetables.",
        ),
        ProductInfoModel(
          title: "Pizza Margherita",
          price: 12.99,
          image: "assets/mock_data/profile.png",
          description:
              "Classic Italian pizza with tomato sauce and mozzarella cheese.",
        ),
        ProductInfoModel(
          title: "Cheese Burger",
          price: 9.50,
          image: "assets/mock_data/profile.png",
          description: "Beef burger with melted cheese, lettuce, and tomato.",
        ),
        ProductInfoModel(
          title: "Creamy Pasta",
          price: 14.25,
          image: "assets/mock_data/profile.png",
          description: "Creamy Alfredo pasta with grilled chicken.",
        ),
        ProductInfoModel(
          title: "Fried Chicken",
          price: 11.75,
          image: "aassets/mock_data/profile.png",
          description: "Crispy fried chicken with special seasoning.",
        ),
        ProductInfoModel(
          title: "Mexican Tacos",
          price: 10.00,
          image: "assets/mock_data/profile.png",
          description: "Soft tacos filled with beef, cheese, and vegetables.",
        ),
      ];

      emit(ListLoaded(products: productList));
    } catch (e) {
      emit(ListError("Something went wrong"));
    }
  }
}
