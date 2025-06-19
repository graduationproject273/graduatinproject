import 'package:flutter/material.dart';
import 'package:gradution/core/widgets/custom_appbar.dart';
import 'package:gradution/features/checkout/presentation/views/widgets/checkout_view_body.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Checkout'),
      body:  CheckoutPage(),
    );
  }
}