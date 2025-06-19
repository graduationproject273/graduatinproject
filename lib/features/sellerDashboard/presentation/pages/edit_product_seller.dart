import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution/depency_injection.dart';
import 'package:gradution/features/products/domain/entities/product_entity.dart';
import 'package:gradution/features/sellerDashboard/presentation/cubit/edit_product_cubit/edit_product_seller_cubit.dart';
import 'package:gradution/features/sellerDashboard/presentation/widgets/edit_product_seller_body.dart';

class EditProductSeller extends StatelessWidget {
  const EditProductSeller({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => sl<EditProductSellerCubit>(),
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: const Text('Edit Product'),
              centerTitle: true,
            ),
            backgroundColor: Colors.white,
            body: EditProductSellerBody(
              productId: productEntity.id,
              name: productEntity.name,
              price: productEntity.price.toString(),
              sellingPrice: productEntity.sellingPrice.toString(),
              discountPrice: productEntity.discountPrice.toString(),
              quantityAvailable: productEntity.quantityAvailable.toString(),
              hardwareSpecifications: productEntity.hardwareSpecifications,
              productDescription: productEntity.description,
              productImage: productEntity.image!,
            )),
      ),
    );
  }
}
