import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/features/cart/domain/entities/cart_item_entity.dart';
import 'package:gradution/features/cart/presentation/widgets/container_total_price.dart';
import 'package:gradution/features/cart/presentation/widgets/list_item_cart.dart';
 

// ignore: camel_case_types
class bodyInCartView extends StatelessWidget {
   final List<CartItemEntity> products ;
  const bodyInCartView({
    super.key, required this.products, 
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: listItemsCarts(products: products,),
          ),
          SizedBox(
            height: 40.h,
          ),
          containerTotalPrice(cartEntity: products,),
          SizedBox(
            height: 40.h,
          ),
        ],
      ),
    );
  }
}
