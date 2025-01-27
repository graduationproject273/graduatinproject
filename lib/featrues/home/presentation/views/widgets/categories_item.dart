import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/constants/images.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/styles/textstyles.dart';

class Categoriesitem extends StatelessWidget {
  const Categoriesitem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
          width: 82.h,
          height: 82.h,
          decoration: BoxDecoration(
            color: coloritemcat,// لون الخلفية
            borderRadius: BorderRadius.circular(8), // زوايا دائرية
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // الصورة
              ClipRRect(
    borderRadius: BorderRadius.circular(8),
    child: Image.asset(
      Assets.imagesCameres,
      width: 55.h,
      height: 55.h,
      fit: BoxFit.cover,
    ),
              ),
              const SizedBox(height: 4),
              // الاسم
              Text(
    'Cameres',
    style: Textstyles.textitemcat ,
    textAlign: TextAlign.center,
              ),
            ],
          ),
        );
  }
}