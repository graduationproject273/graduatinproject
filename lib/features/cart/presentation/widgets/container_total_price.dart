import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution/core/routeing/routes.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/styles/textstyles.dart';
import 'package:gradution/core/widgets/custom_button.dart';
import 'package:gradution/features/cart/presentation/cubits/cubit/cart_cubit.dart';

// ignore: camel_case_types
class containerTotalPrice extends StatelessWidget {
  const containerTotalPrice({super.key});

  @override
  Widget build(BuildContext context) {
    final totalPrice =
        context.watch<CartCubit>().getTotalPrice().toStringAsFixed(2);

    return Container(
      width: double.infinity,
      height: 0.15.sh,
      color: colortotalincart,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Total  ',
                style: Textstyles.textitemtotal,
              ),
              Text(
                '$totalPrice EGP',
                style: Textstyles.texttotalprice,
              ),
              const Spacer(),
              SizedBox(
                width: 170.w,
                child: CustomButton(
                  text: 'Checkout',
                  onTap: () {
                    GoRouter.of(context).go(Routes.checkout);
                  },
                  buttonbodycolor: maincolor,
                  textcolor: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
