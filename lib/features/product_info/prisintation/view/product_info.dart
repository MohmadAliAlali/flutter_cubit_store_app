import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/product_info_cubit.dart';
import '../manager/product_info_state.dart';

class ProductInfoPage extends StatelessWidget {
  const ProductInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductInfoCubit>();

    return BlocProvider.value(
      value: cubit..loadProduct(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(cubit.product.title), // لا نستخدم state هنا
          centerTitle: true,
        ),
        body: BlocBuilder<ProductInfoCubit, ProductInfoState>(
          builder: (context, state) {
            if (state is ProductInfoLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is ProductInfoLoaded) {
              final p = state.product;

              return SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(
                      p.image,
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      p.title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        p.description,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "${p.price} \$",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              );
            }

            if (state is ProductInfoError) {
              return Center(
                child: Text(state.message,
                    style: const TextStyle(color: Colors.red, fontSize: 18)),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
