import 'package:flutter/material.dart';
import 'package:gradution/constants/images.dart';
import 'package:gradution/featrues/onbording/presentation/views/widgets/color_onboarding.dart';

// ignore: camel_case_types
class bodyOnboarding extends StatelessWidget {
  const bodyOnboarding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
    
        Image.asset(Assets.imagesOnboardingimagethird,
        width: double.infinity,
        height: double.infinity
        ,
        fit: BoxFit.cover,),
    
        
         Positioned(
          bottom: 0,
           child:const coloronboarding(),
         ),
       
    
        // المحتوى فوق الخلفية
      ],
    );
  }
}

// ignore: camel_case_types
