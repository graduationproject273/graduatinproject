import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradution/constants/images.dart';
import 'package:gradution/featrues/onbording/presentation/views/widgets/button_and_indicators.dart';
import 'package:gradution/featrues/onbording/presentation/views/widgets/onboaeding_view_body.dart';
import 'package:gradution/featrues/onbording/presentation/views/widgets/texts_in_onboarding.dart';


class OnboardingView extends StatelessWidget {
  const OnboardingView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          TextsInOnboarding(text1: 'Convenience', text2: 'Control your home devices using a single app from anywhere in the world'),
          SizedBox(height: 20,),
          ButtonAndIndicators()
        ]
      )),
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
    );
  }
}
