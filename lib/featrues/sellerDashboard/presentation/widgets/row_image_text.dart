import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/constants/images.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/styles/textstyles.dart';

class RowimageText extends StatelessWidget {
  const RowimageText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // ignore: deprecated_member_use
      color: maincolor.withOpacity(0.1),
      child: Row(
        children: [
          Image.asset(
            Assets.imagesCameres,
            fit: BoxFit.cover,
            height: 100.h,
            width: 100.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Order #{index + 1}',
                style: Textstyles.textitemcart.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Text(
                'fontWeight: FontWeight.bold,',
                style: Textstyles.textitemcart.copyWith(
                    fontSize: 12.sp,
                    //  fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Text(
                'Order #{index + 1}',
                style: Textstyles.textitemcart.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )
            ],
          ),
        ],
      ),
    );
  }
}
