
import 'package:flutter/material.dart';
import 'package:gradution/featrues/cart/presentation/widgets/body_in_cart_view.dart';
import '../widgets/row_appbar_in_cart.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: rowAppBarInCart(),
      ),
      backgroundColor: Colors.white,
      body: bodyInCartView(),
    );
  }
}

// ignore: camel_case_types
