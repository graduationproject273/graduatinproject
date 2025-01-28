import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: camel_case_types
class rowAppBarInCart extends StatelessWidget {
  const rowAppBarInCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Text('Cart ',style: TextStyle(fontSize: 25.sp,fontWeight: FontWeight.bold),),
         Container(
          width: 25.w,
          height: 25.h,
          decoration: BoxDecoration(
            color: Color(0xffE5EBFC),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(child: Center(child: Text('3',style: TextStyle(fontSize: 18.sp),))),
          )
      ],
    );
  }
}