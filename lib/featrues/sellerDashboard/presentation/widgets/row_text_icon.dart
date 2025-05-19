import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/styles/textstyles.dart';

class RowTextAndIcon extends StatelessWidget {
  const RowTextAndIcon({
    super.key,
    required this.index,
  });
  final int index; // Example index, you can replace it with your own logic
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40.h,
          width: 40.h,
          decoration: BoxDecoration(
            color: maincolor,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Icon(
              Icons.electric_bolt,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(width: 10.w),
        Column(
          children: [
            Text(
              'Order #${index + 1}',
              style: Textstyles.textitemcart.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: maincolor),
            ),
            Text(
              'Order #${index + 1}',
              style: Textstyles.textitemcart.copyWith(
                  fontSize: 10.sp,
                  //  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade400),
            )
          ],
        ),
      ],
    );
  }
}
