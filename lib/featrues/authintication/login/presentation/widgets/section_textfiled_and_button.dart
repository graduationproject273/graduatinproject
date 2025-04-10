import 'package:flutter/material.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/widgets/custom_button.dart';
import 'package:gradution/core/widgets/custom_textfield.dart';

class SectionTextFiledAndButton extends StatelessWidget {
  const SectionTextFiledAndButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextformfield(
          hintText: 'tomas257@gmail.com',
          keyboardType: TextInputType.emailAddress,
          color: Colors.white,
          colorborder: textcolorinauthpagebuttons,
        ),
        const SizedBox(height: 20),
        CustomTextformfield(
          hintText: 'OTP',
          keyboardType: TextInputType.number,
          color: Colors.white,
          colorborder: textcolorinauthpagebuttons,
        ),
        const SizedBox(height: 40),
        CustomButton(text: 'Sign In', onTap: () {}),
      ],
    );
  }
}

