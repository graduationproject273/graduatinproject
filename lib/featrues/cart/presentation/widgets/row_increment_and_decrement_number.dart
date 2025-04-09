import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/styles/textstyles.dart';

// ignore: camel_case_types
class rowIncrementAndDecrementNumber extends StatelessWidget {
  const rowIncrementAndDecrementNumber({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // زر (-) داخل دائرة
        CircleAvatar(
          backgroundColor: maincolor,
          radius: 15.sp,
          child: IconButton(
            icon: Icon(
              size: 15.sp,
              Icons.remove,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ),
        const SizedBox(width: 16),
        // الرقم في المنتصف
        Text(
          '1',
          style: Textstyles.textitemcartnumber,
        ),
        const SizedBox(width: 16),
        // زر (+) داخل دائرة
        CircleAvatar(
          backgroundColor: maincolor,
          radius: 15.sp,
          child: IconButton(
            icon: Icon(
              size: 15.sp,
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}

// ignore: camel_case_types
