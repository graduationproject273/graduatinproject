import 'package:flutter/material.dart';
import 'package:gradution/featrues/onbording/presentation/views/widgets/onboaeding_view_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(child: OnboaedingViewBody()),
    );
  }
}