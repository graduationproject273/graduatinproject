import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/core/styles/textstyles.dart';

class TextsInOnboarding extends StatelessWidget {
  const TextsInOnboarding({super.key, required this.text1, required this.text2});
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(text1,style: Textstyles.text1Inonboarding)),
          SizedBox(height: 4.h,),
        Text(text2,style: Textstyles.text2Inonboarding),
      ],
    );
  }
}