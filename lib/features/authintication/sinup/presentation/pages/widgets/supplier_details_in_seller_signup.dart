import 'package:flutter/material.dart';
import 'package:gradution/core/widgets/custom_textfield.dart';

class SupplierDetailsInSellerSignup extends StatelessWidget {
  const SupplierDetailsInSellerSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextformfield(hintText: 'Business Name', keyboardType: TextInputType.text),
            const SizedBox(height: 20),
            CustomTextformfield(hintText: 'Seller Name', keyboardType: TextInputType.text),
            const SizedBox(height: 20),
            CustomTextformfield(hintText: 'Email', keyboardType: TextInputType.text),
          ],
        ),
      ),
    );
  }
}