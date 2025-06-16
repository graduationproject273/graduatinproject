// SellerSignup.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution/depency_injection.dart';
import 'package:gradution/features/authintication/sinup/presentation/cubit/seller_cubit/cubit/seller_cubit.dart';
import 'package:gradution/features/authintication/sinup/presentation/pages/widgets/signup_seller_view_body.dart';

class SellerSignup extends StatelessWidget {
  const SellerSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SellerCubit, SellerState>(
      listener: (context, state) {
        if (state is SellerSuccess) {
          print('sxdcfvgbhnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn');
        } else if (state is SellerError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: BlocProvider(
        create: (context) => sl<SellerCubit>(),
        child: const SellerStepsPage(), // تأكد من إضافة const هنا
      ),
    );
  }
}
