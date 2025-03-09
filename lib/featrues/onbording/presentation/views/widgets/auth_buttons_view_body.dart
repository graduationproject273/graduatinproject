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

    return SingleChildScrollView(
      child: Column(
        children: [
  Stack(
  children: [
    /// الصورة مع قص الحواف
    ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(40.r),
        bottomRight: Radius.circular(40.r),
      ),
      child: Image.asset(
        Assets.images96f45ec46c3f43e470052afdd3c8c147,
        fit: BoxFit.cover,
        width: double.infinity, // تأكد من امتداد الصورة
        height: 270.h, // حدد ارتفاعًا مناسبًا
      ),
    ),

    /// الطبقة السوداء الشفافة فوق الصورة
    Positioned.fill(
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40.r),
          bottomRight: Radius.circular(40.r),
        ),
        child: Container(
          // ignore: deprecated_member_use
          color: Colors.black.withOpacity(0.5), // تعديل الشفافية حسب الحاجة
        ),
      ),
    ),
  ],
),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
            child: Column(
              children: [
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
        ],
      ),
    );
  }
}