import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution/core/routeing/routes.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/styles/textstyles.dart';
import 'package:gradution/core/widgets/custom_button.dart';
import 'package:gradution/features/cart/domain/entities/cart_item_entity.dart';
import 'package:gradution/features/cart/presentation/cubits/cubit/cart_cubit.dart';

// ignore: camel_case_types
class ContainerTotalPrice extends StatelessWidget {
  final List<CartItemEntity> cartEntity;
  const ContainerTotalPrice({super.key, required this.cartEntity});

  @override
  Widget build(BuildContext context) {
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
              // 👇 استخدم StreamBuilder هنا
              StreamBuilder<double>(
                stream: Stream.value(context.watch<CartCubit>().getTotalPrice()),
                builder: (context, snapshot) {
                  final priceText = snapshot.hasData
                      ? "${snapshot.data!.toStringAsFixed(2)} EGP"
                      : "0.00 EGP";
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total',
                        style: Textstyles.textitemtotal,
                      ),
                      Text(
                        priceText,
                        style: Textstyles.texttotalprice,
                      ),
                    ],
                  );
                },
              ),
              const Spacer(),
              SizedBox(
                width: 140.w,
                child: CustomButton(
                  text: 'Checkout',
                  onTap: () {
                    if (cartEntity.isNotEmpty) {
                      context.read<CartCubit>().clearCart();
  GoRouter.of(context)
      .push(Routes.checkout, extra: cartEntity);
}
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

