import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/constants/images.dart';
import 'package:gradution/core/routeing/routes.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/styles/textstyles.dart';
import 'package:gradution/core/widgets/custom_button.dart';

class AuthButtonsViewBody extends StatelessWidget {
  const AuthButtonsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.0.h,vertical: 20.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(Assets.imagesAuthbuttonsimage,fit: BoxFit.cover,),
            SizedBox(height: 20.h),
            Text(
              'Easily Control Your Home',
              style: Textstyles.text3Inonboarding
            ),
            SizedBox(height: 10.h),
            Text(
              'Manage your home from anytime, anywhere.',
              style: Textstyles.text4Inonboarding 
              ),
            SizedBox(height: 20.h),
            CustomButton(text: 'Create a account',onTap: (){
              Navigator.pushNamed(context, Routes.register);
            }),
            SizedBox(height: 10.h),
            CustomButton(text: 'Sign In',onTap: (){
              Navigator.pushNamed(context, Routes.login);
            },buttonbodycolor: Colors.white,textcolor: maincolor,bordercolor: maincolor,),
          ],
        ),
      ),
    );
  }
}