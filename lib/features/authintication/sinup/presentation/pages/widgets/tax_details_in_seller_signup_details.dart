import 'package:flutter/material.dart';
import 'package:gradution/core/widgets/custom_textfield.dart';

class TaxDetailsInSellerSignupDetails extends StatelessWidget {
  const TaxDetailsInSellerSignupDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextformfield(hintText: 'Mobile', keyboardType: TextInputType.number),
            const SizedBox(height: 20),
            CustomTextformfield(hintText: 'TIN', keyboardType: TextInputType.number),
          ],
        ),
      ),
    );
  }
}