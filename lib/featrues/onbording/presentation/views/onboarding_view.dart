import 'package:flutter/material.dart';


import 'package:gradution/featrues/onbording/presentation/views/widgets/body_onboarding.dart';


class OnboardingView extends StatelessWidget {
  const OnboardingView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
     /* body: Stack(
        children: [
          // خلفية SVG
          SvgPicture.asset(
            Assets.imagesOnboardingimagethird,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),

          // تدرج لوني فوق الخلفية
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent, // لون أغمق
                  Colors.black, // شفاف
                ],
                begin: Alignment.topCenter, // يبدأ من الأعلى
                end: Alignment.bottomCenter, // ينتهي في الأسفل
              ),
            ),
          ),

          // المحتوى فوق الخلفية
        ],
      ),*/


    //  body: SafeArea(child: OnboaedingViewBody()),
      body: const bodyOnboarding(),
    );
  }
}

// ignore: camel_case_types
