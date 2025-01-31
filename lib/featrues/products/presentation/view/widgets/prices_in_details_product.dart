import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/core/styles/colors.dart';

class PricesInDetailsProduct extends StatelessWidget {
  const PricesInDetailsProduct(
      {super.key, required this.oldPrice, required this.currentPrice});
  final String oldPrice, currentPrice;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // السعر الحالي
        Text(
          '\$$currentPrice',
          style: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(width: 4),
        // السعر القديم
        Text(
          '\$$oldPrice',
          style: TextStyle(
            fontSize: 15.sp,
            color: colortotalincart,
            decoration: TextDecoration.lineThrough,
          ),
        ),
      ],
    );
  }
}
