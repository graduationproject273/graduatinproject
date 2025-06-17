import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution/features/products/domain/entities/product_entity.dart';
import 'package:gradution/features/products/presentation/view/widgets/products_details_view_body.dart';

class ProductDetailesView extends StatelessWidget {
  const ProductDetailesView({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body:  ProductsDetailsViewBody(
        productEntity: productEntity,
      ),
    );
  }
}
