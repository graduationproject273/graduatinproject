import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/styles/textstyles.dart';

class Categoriesitem extends StatelessWidget {
  const Categoriesitem({
    super.key, required this.text, required this.image,
  });
  final String text;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 83.h,
      height: 88.h,
      decoration: BoxDecoration(
        color: coloritemcat, // لون الخلفية
        borderRadius: BorderRadius.circular(8), // زوايا دائرية
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // الصورة
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              image,
              width: 55.h,
              height: 55.h,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 4),
          // الاسم
          Text(
            text,
            style: Textstyles.textitemcat,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
