import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/styles/extention.dart';
import 'package:gradution/core/styles/textstyles.dart';

class ItemPhoneAndEmailInConactus extends StatelessWidget {
  const ItemPhoneAndEmailInConactus({super.key, required this.text1, required this.text2, required this.icon});
final String text1;
final String text2;
final Widget icon;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: context.width * .45,
        height: context.width * .45,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: colortotalincart, width: 1),
        ),
        child: Column(
          spacing: 5.h,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50.w,
              height: 50.w,
              decoration: BoxDecoration(
                color: maincolor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: icon
            ),
            Text(
              text1,
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
            Text(
              text2,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: Textstyles.text4Inonboarding.copyWith(fontSize: 11.sp),
            ),
          ],
        ));
  }
}
