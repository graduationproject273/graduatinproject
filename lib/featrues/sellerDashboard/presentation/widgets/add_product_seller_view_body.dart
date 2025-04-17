import 'package:flutter/material.dart';
import 'package:gradution/core/styles/textstyles.dart';
import 'add_product_form.dart';

class AddProductSellerViewBody extends StatelessWidget {
  const AddProductSellerViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text('You Can add a Product now!', style: Textstyles.namereview),
                const SizedBox(height: 20),
                const AddProductForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
