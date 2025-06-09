import 'package:flutter/material.dart';

import 'package:gradution/features/products/presentation/view/widgets/appber_in_product.dart';
import 'package:gradution/features/products/presentation/view/widgets/products_view_body.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppberInProduct(
          icon: const Icon(
            Icons.shopping_cart,
            color: Colors.black,
          ),
          title: 'EZhome',
          context: context,
        ),
        body: ProductsViewBody());
  }
}
