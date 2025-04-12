import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution/core/routeing/routes.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/styles/textstyles.dart';
import 'package:gradution/core/widgets/custom_button.dart';
import 'package:gradution/core/widgets/custom_textfield.dart';

class SectionTextFiledAndButtoninSinup extends StatefulWidget {
  const SectionTextFiledAndButtoninSinup({
    super.key,
  });

  @override
  State<SectionTextFiledAndButtoninSinup> createState() =>
      _SectionTextFiledAndButtoninSinupState();
}

class _SectionTextFiledAndButtoninSinupState
    extends State<SectionTextFiledAndButtoninSinup> {
  bool isChecked = false;
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
        Row(
          children: [
            Checkbox(
              activeColor: maincolor,
              value: isChecked,
              onChanged: (bool? newValue) {
                setState(() {
                  isChecked = newValue!;
                });
              },
            ),
            Text(
              'I accept terms & conditions.',
              style: Textstyles.descrpcolorinreviews
                  .copyWith(color: textcolorinauthpagebuttons),
            )
          ],
        ),
        const SizedBox(height: 40),
        CustomButton(
            text: 'Sign Up',
            onTap: () {
              GoRouter.of(context).push(Routes.service);
            }),
      ],
    );
  }
}
