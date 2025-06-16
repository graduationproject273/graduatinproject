import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution/core/widgets/custom_textfield.dart';
import 'package:gradution/features/authintication/sinup/presentation/cubit/seller_cubit/cubit/seller_cubit.dart';

class SupplierDetailsInSellerSignup extends StatelessWidget {
  const SupplierDetailsInSellerSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextformfield(hintText: 'Business Name', keyboardType: TextInputType.text,
            controller: context.read<SellerCubit>().bussinessNameController,),
            const SizedBox(height: 20),
            CustomTextformfield(hintText: 'Seller Name', keyboardType: TextInputType.text,
            controller: context.read<SellerCubit>().nameController,),
            const SizedBox(height: 20),
            CustomTextformfield(hintText: 'Email', keyboardType: TextInputType.text,
            controller: context.read<SellerCubit>().emailController,),
          ],
        ),
      ),
    );
  }
}