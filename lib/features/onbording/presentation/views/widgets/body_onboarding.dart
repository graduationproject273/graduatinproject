import 'package:flutter/material.dart';

import 'package:gradution/features/onbording/presentation/views/widgets/color_onboarding.dart';

class BodyOnboarding extends StatelessWidget {
  final String text1;
  final String text2;
  final bool isVisible;
  final String image;
  const BodyOnboarding({
    super.key,
    required this.text1,
    required this.text2,
    required this.isVisible,
    required this.image,
  });

  @override

  /// This widget is the body of the onboarding screen,
  /// it shows the background image and the texts and the skip button
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
      
        coloronboarding(
            image: image,
            text1: text1,
            text2: text2, isVisible: isVisible,
          ),
        ],
    );
  }
}
