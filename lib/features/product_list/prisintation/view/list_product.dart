import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1_cubit/core/navigation.dart';
import 'package:task1_cubit/core/widget/list_view_iem.dart';
import 'package:task1_cubit/features/product_info/prisintation/manager/product_info_cubit.dart';
import 'package:task1_cubit/features/product_info/prisintation/view/product_info.dart';
import 'package:task1_cubit/features/product_list/prisintation/manager/list_product_cubit.dart';

class ListProduct extends StatelessWidget {
  const ListProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ListCubit()..loadListContent(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Products"), centerTitle: true),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: BlocBuilder<ListCubit, ListProductState>(
            builder: (context, state) {
              if (state is ListLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is ListLoaded) {
                return ListView.separated(
                  itemCount: state.products.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 2),
                  itemBuilder: (context, index) {
                    final product = state.products[index];

                    return BlocProvider(
                      create: (_) => ProductInfoCubit(),
                      child: Builder(
                        builder: (context) {
                          return GestureDetector(
                            onTap: () {
                              final infoCubit = ProductInfoCubit()
                                ..setProduct(product);

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => BlocProvider.value(
                                    value: infoCubit,
                                    child: const ProductInfoPage(),
                                  ),
                                ),
                              );
                            },

                            child: ListViewIem(
                              title: Image.asset(
                                'assets/mock_data/profile.png',
                              ),
                              info: product.title,
                              
                              width2: 250,
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              }

              if (state is ListError) {
                return Center(
                  child: Text(
                    state.message,
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
