import 'package:flutter/material.dart';
import 'package:gradution/constants/images.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/styles/extention.dart';
import 'package:gradution/core/styles/textstyles.dart';
import 'package:gradution/core/widgets/custom_button.dart';
import 'package:gradution/core/widgets/custom_textfield.dart';

class BodyLoginView extends StatelessWidget {
  const BodyLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
              
              ),
            ),
            const SizedBox(height: 40),
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
        
            // Add your login form here
            // For example, you can use TextFormField for email and password inputs
          ],
        ),
      ),
    );
  }
}
