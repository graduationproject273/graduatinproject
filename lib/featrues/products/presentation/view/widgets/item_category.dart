import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/core/styles/textstyles.dart';

// ignore: camel_case_types
class itemCategory extends StatelessWidget {
  const itemCategory({
    super.key, required this.text, required this.color,
  });
final String text;
final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: Container(
                  height: 40.h,
                 // width: double.infinity,
                  decoration: BoxDecoration(
      color: color, // لون الخلفية
      borderRadius: BorderRadius.circular(8), // زوايا دائرية
                  ),
                  child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text(
         text,
          style: Textstyles.textitemcat2,
          textAlign: TextAlign.center,
        ),
      ),
                  ),
                ),
    );
  }
}
