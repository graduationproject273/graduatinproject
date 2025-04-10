import 'package:flutter/material.dart';
import 'package:gradution/core/styles/textstyles.dart';

class SelectUserTypeText extends StatelessWidget {
  const SelectUserTypeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Select your user type', style: Textstyles.namereview),
        SizedBox(height: 10),
        Text(
          'Are you a regular user or a seller?',
          style: Textstyles.namereview.copyWith(color: Colors.grey, fontSize: 15),
        ),
      ],
    );
  }
}
