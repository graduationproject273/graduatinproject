import 'package:flutter/material.dart';
import 'package:gradution/core/widgets/custom_textfield.dart';

class DetailsInSellerSignupWidget extends StatelessWidget {
  const DetailsInSellerSignupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          
          children: [
            CustomTextformfield(
              hintText: 'AccountNumber',
              keyboardType: TextInputType.number,
              color: Colors.white,
            ),
            const SizedBox(height: 20),
            CustomTextformfield(
              hintText: 'SWIFT Code',
              keyboardType: TextInputType.number,
              color: Colors.white,
            ),
            const SizedBox(height: 20),
            CustomTextformfield(
              hintText: 'Account Holder Name',
              keyboardType: TextInputType.text,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
