import 'package:flutter/material.dart';
import 'package:gradution/constants/images.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/styles/extention.dart';
import 'package:gradution/core/styles/textstyles.dart';

class ColumnTextAndImageLogin extends StatelessWidget {
  const ColumnTextAndImageLogin({
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
          'Sign In',
          style: Textstyles.texttitlelogin,
        ),
        const SizedBox(height: 20),
         Text(
              'Enter your email and password to get into the app!',
              style: Textstyles.descrpcolorinreviews.copyWith(
                color: textcolorinauthpagebuttons
              
              ),)
      ],
    );
  }
}
