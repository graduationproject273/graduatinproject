import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/core/styles/colors.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final Color? bordercolor;
  final Color? textcolor;
  final Color? buttonbodycolor;
  final void Function()? onTap;
  final Widget? child;
  final FontWeight? fontWeight;
  const CustomButton({super.key,  this.text, this.onTap, this.bordercolor, this.textcolor, this.buttonbodycolor, this.fontWeight, this.child,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50.h,
        decoration: BoxDecoration(
          border: Border.all(color: bordercolor ?? maincolor),
          color: buttonbodycolor ?? maincolor,
          borderRadius: BorderRadius.circular(16),
        ),
        child:child?? Center(
          child: Text(
            text??'',
            style: TextStyle(
              color: textcolor ?? Colors.white,
              fontSize: 16.sp,
              fontWeight:fontWeight?? FontWeight.bold,
            ),
          ),
        ),
      ),
      );
  }
}