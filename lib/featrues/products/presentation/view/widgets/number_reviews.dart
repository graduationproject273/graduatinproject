// ignore: camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/styles/textstyles.dart';

class NumberReviews extends StatelessWidget {
  const NumberReviews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.star, color: Colors.yellow, size: 24.sp),
            Text(
              ' 4.5',
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              ' (500 Reviews)',
              style: TextStyle(fontSize: 14.sp, color: colortotalincart),
            ),
          ],
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            
          },
          child: Text('See All', style: Textstyles.namereview.copyWith(color: Colors.grey, fontSize: 15),))
      ],
    );
  }
}
