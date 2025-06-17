import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/core/widgets/custom_button.dart';
import 'package:gradution/features/cart/domain/entities/cart_entity.dart';
import 'package:gradution/features/cart/presentation/cubits/cubit/cart_cubit.dart';
import 'package:gradution/features/products/domain/entities/product_entity.dart';

class ButtonsInDetailsPage extends StatelessWidget {
  const ButtonsInDetailsPage({super.key, required this.productentity});
  final ProductEntity productentity;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is AddtoCartLoaded) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Product added to cart successfully!'),
              backgroundColor: Colors.green,
            ),
          );
        } 
      },
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 60.w,
              height: 50.h,
              decoration: BoxDecoration(
                color: const Color(0xffF0F0F0),
                borderRadius: BorderRadius.circular(8),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite_border),
              ),
            ),
            SizedBox(width: 60.w),
            SizedBox(
              width: 220.w,
              child: CustomButton(
                text: 'Add to cart',
                onTap: () {
                  context.read<CartCubit>().addToCart(
                        CartEntity(
                          productId: productentity.id,
                          quantity: productentity.quantityAvailable,
                        ),
                      );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
