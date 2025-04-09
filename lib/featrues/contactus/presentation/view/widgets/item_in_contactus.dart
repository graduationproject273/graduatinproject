import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/styles/extention.dart';

class ItemInContactus extends StatelessWidget {
  const ItemInContactus(
      {super.key,
    
      required this.text1,
      required this.text2, required this.icon});
 
  final String text1;
  final String text2;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.height * 0.12,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        // ignore: deprecated_member_use
        border: Border.all(color: Colors.grey.withOpacity(0.6), width: 2),
      ),
      child: Row(
        children: [
          SizedBox(width: 10.w),
          Container(
              width: 50.w,
              height: 50.w,
              decoration: BoxDecoration(
                color: maincolor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: icon),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text1,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                text2,
                style: TextStyle(
                  color: Color(0xff717171),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            width: 40.w,
              height: 40.w,
            decoration: BoxDecoration(
              color: maincolor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon( Icons.ios_share_rounded, color: Colors.white),
          ),
          SizedBox(width: 10.w),
        ],
      ),
    );
  }
}
