import 'package:flutter/material.dart';
import 'package:gradution/core/widgets/custom_textfield.dart';
import 'package:gradution/features/authintication/sinup/presentation/cubit/seller_cubit/cubit/seller_cubit.dart';

class TaxDetailsInSellerSignupDetails extends StatelessWidget {
  final SellerCubit cubit;

  const TaxDetailsInSellerSignupDetails({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextformfield(
              hintText: 'Mobile',
              keyboardType: TextInputType.number,
              controller: cubit.mobileController,
            ),
            const SizedBox(height: 20),
            CustomTextformfield(
              hintText: 'TIN',
              keyboardType: TextInputType.number,
              controller: cubit.TINController,
            ),
          ],
        ),
      ),
    );
  }
}
