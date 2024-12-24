import 'package:flutter/material.dart';
import 'package:gradution/core/routeing/routes.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Onboarding'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Routes.register);
          },
          child: Text('Go to register'),
        ),
      ),
    );
  }
}