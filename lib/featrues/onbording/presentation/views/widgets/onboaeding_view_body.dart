import 'package:flutter/material.dart';
import 'package:gradution/featrues/onbording/presentation/views/widgets/button_and_indicators.dart';
import 'package:gradution/featrues/onbording/presentation/views/widgets/texts_in_onboarding.dart';

class OnboaedingViewBody extends StatelessWidget {
  const OnboaedingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        TextsInOnboarding(text1: 'Convenience', text2: 'Control your home devices using a single app from anywhere in the world'),
        const SizedBox(height: 20,),
        ButtonAndIndicators(),
      ],
    );
  }
}