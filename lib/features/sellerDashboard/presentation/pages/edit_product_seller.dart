import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution/depency_injection.dart';
import 'package:gradution/features/products/domain/entities/product_entity.dart';
import 'package:gradution/features/sellerDashboard/presentation/cubit/add_product_cubit/add_product_cubit.dart';
import 'package:gradution/features/sellerDashboard/presentation/cubit/get_product_seller_cubit/get_product_seller_cubit.dart';
import 'package:gradution/features/sellerDashboard/presentation/cubit/edit_product_cubit/edit_product_seller_cubit.dart';
import 'package:gradution/features/sellerDashboard/presentation/widgets/edit_product_seller_body.dart';

class EditProductSeller extends StatelessWidget {
  const EditProductSeller({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: sl<EditProductSellerCubit>()
              ..setInitialValues(productEntity),
          ),
          BlocProvider.value(
            value:  sl<AddProductCubit>(),
          ),
           BlocProvider.value(
            value:  sl<GetProductSellerCubit>(),
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text('Edit Product'),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          backgroundColor: Colors.white,
          body: EditProductSellerBody(id: productEntity.id),
        ),
      ),
    );
  }
}
