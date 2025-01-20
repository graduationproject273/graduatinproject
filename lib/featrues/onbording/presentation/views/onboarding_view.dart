import 'package:flutter/material.dart';


import 'package:gradution/featrues/onbording/presentation/views/widgets/body_onboarding.dart';


class OnboardingView extends StatelessWidget {
  const OnboardingView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    //  body: SafeArea(child: OnboaedingViewBody()),
      body: const bodyOnboarding(),
    );
  }
}

// ignore: camel_case_types
