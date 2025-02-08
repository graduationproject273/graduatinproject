import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/constants/images.dart';
import 'package:gradution/core/styles/colors.dart';

class ItemInContactus extends StatelessWidget {
  const ItemInContactus({super.key, required this.image, required this.text1, required this.text2});
  final String image;
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    final screenhight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      height: screenhight * 0.15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.withOpacity(0.6), width: 2),
      ),
      child: Row(
        children: [
          SizedBox(width: 10.w),
          Container(
            width: screenwidth * 0.16,
            height: screenhight * 0.09,
            decoration: BoxDecoration(
              color: maincolor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset(image,width: screenwidth * 0.15, height: screenhight * 0.10,),
          ),
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
               width: screenwidth * 0.16,
            height: screenhight * 0.09,
            decoration: BoxDecoration(
              color: maincolor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset(Assets.imagesVector,color: Colors.white,),
          ),
          SizedBox(width: 10.w),
        ],
      ),
    );
  }
}
