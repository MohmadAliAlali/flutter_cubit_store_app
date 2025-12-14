import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1_cubit/features/home/prisintation/view/widget/horizantel_glass_card.dart';
import 'package:task1_cubit/features/home/prisintation/view/widget/virtical_card.dart';
import 'package:task1_cubit/features/product_info/data/product_info_model.dart';
import 'package:task1_cubit/features/product_info/prisintation/manager/product_info_cubit.dart';
import 'package:task1_cubit/features/product_info/prisintation/view/product_info.dart';
import 'package:task1_cubit/features/product_list/prisintation/manager/list_product_cubit.dart';

class HorizontalProductsList extends StatelessWidget {
  const HorizontalProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListCubit, ListProductState>(
      builder: (_, state) {
        if (state is ListLoaded) {
          final cubit = context.read<ListCubit>();
          final products = cubit.filteredByRate; // فقط المنتجات المفلترة
          return _buildList(context, products, Axis.horizontal);
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class VerticalProductsList extends StatelessWidget {
  const VerticalProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListCubit, ListProductState>(
      builder: (_, state) {
        if (state is ListLoaded) {
          final cubit = context.read<ListCubit>();
          final products = cubit.allProducts; 
          return _buildList(context, products, Axis.vertical);
        }
        return const SizedBox.shrink();
      },
    );
  }
}

Widget _buildList(
  BuildContext context,
  List<ProductInfoModel> products,
  Axis axis,
) {
  return ListView.separated(
    padding: axis == Axis.vertical
        ? EdgeInsets.only(top: 100.h, bottom: 70.h)
        : EdgeInsets.zero,
    shrinkWrap: true,
    physics: const BouncingScrollPhysics(),
    scrollDirection: axis,
    itemCount: products.length,
    separatorBuilder: (_, __) => SizedBox(
      width: axis == Axis.horizontal ? 12.w : 0,
      height: axis == Axis.vertical ? 12.h : 0,
    ),
    itemBuilder: (_, i) {
      final product = products[i];
      return GestureDetector(
        onTap: () => _openProductInfo(context, product),
        child: axis == Axis.horizontal
            ? horizontalCard(product, context)
            : verticalCard(product, context),
      );
    },
  );
}





void _openProductInfo(BuildContext context, ProductInfoModel product) {
  final infoCubit = ProductInfoCubit()..setProduct(product);
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) =>
          BlocProvider.value(value: infoCubit, child: const ProductInfoPage()),
    ),
  );
}
