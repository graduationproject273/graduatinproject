import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/featrues/cart/presentation/widgets/container_total_price.dart';
import 'package:gradution/featrues/cart/presentation/widgets/list_item_cart.dart';

// ignore: camel_case_types
class bodyInCartView extends StatelessWidget {
  const bodyInCartView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: listItemsCarts(),
          ),
          SizedBox(
            height: 40.h,
          ),
          containerTotalPrice(),
          SizedBox(
            height: 40.h,
          ),
        ],
      ),
    );
  }
}
