// ignore_for_file: deprecated_member_use
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/core/styles/colors.dart';

class ButtonAndIndicators extends StatelessWidget {
  const ButtonAndIndicators({
    super.key,
    required this.position,
    required this.animationController,
    required this.onNextPressed,
  });

  final int position;
  final AnimationController animationController;
  final VoidCallback onNextPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            return DotsIndicator(
              dotsCount: 3,
              position: position,
              decorator: DotsDecorator(
                activeColor: maincolor,
                color: Colors.grey,
                spacing: const EdgeInsets.all(2),
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            );
          },
        ),
        ClipOval(
          child: Material(
            color: maincolor, // لون الزر
            child: InkWell(
              onTap: onNextPressed, // استدعاء الوظيفة
              splashColor: Colors.white.withOpacity(0.2), // تأثير النقر
              child:  SizedBox(
                width: 52.h, // العرض
                height: 52.h, // الارتفاع
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
