import 'package:flutter/material.dart';
import 'package:gradution/core/routeing/routes.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product'),
      ),
      body: Column(
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routes.productDetails);
              },
              child: Text('Product Details'),
            ),
          ),
        ],
      ),
    );
  }
}