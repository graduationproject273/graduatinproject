import 'package:flutter/material.dart';
import 'package:gradution/constants/images.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/styles/extention.dart';
import 'package:gradution/core/styles/textstyles.dart';

class SectionTextAndImageInSinup extends StatelessWidget {
  const SectionTextAndImageInSinup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Align(
                alignment: Alignment.center,
                child: Image.asset(Assets.imagesAuthbuttonsimage,
                    width: context.width*.5, height:context.width*.5)),
        
            const SizedBox(height: 20),
        Text(
          'Create Account',
          style: Textstyles.texttitlelogin,
        ),
        const SizedBox(height: 20),
         Text(
              'Looks like you don’t have an account. Let’s create a new account for you.',
              style: Textstyles.descrpcolorinreviews.copyWith(
                color: textcolorinauthpagebuttons
              
              ),)
      ],
    );
  }
}
