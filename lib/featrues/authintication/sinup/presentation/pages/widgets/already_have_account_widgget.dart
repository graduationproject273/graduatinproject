import 'package:flutter/material.dart';
import 'package:gradution/core/widgets/custom_button.dart';

class AlreadyHaveAccountWidgget extends StatelessWidget {
  const AlreadyHaveAccountWidgget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Text('Already have an account?'),
          const SizedBox(height: 10),
          CustomButton(text: 'Login', onTap: () {}),
        ],
      ),
    );
  }
}