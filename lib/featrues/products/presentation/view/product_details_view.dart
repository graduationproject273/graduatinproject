import 'package:flutter/material.dart';
import 'package:gradution/featrues/products/presentation/view/widgets/products_details_view_body.dart';

class ProductDetailesView extends StatelessWidget {
  const ProductDetailesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: const ProductsDetailsViewBody(),
    );
  }
}
