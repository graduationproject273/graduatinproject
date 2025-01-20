import 'package:flutter/material.dart';
import 'package:gradution/constants/images.dart';
import 'package:gradution/featrues/onbording/presentation/views/widgets/button_and_indicators.dart';
import 'package:gradution/featrues/onbording/presentation/views/widgets/color_onboarding.dart';
import 'package:gradution/featrues/onbording/presentation/views/widgets/texts_in_onboarding.dart';

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
          Positioned(
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
               
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width*.9,
                child: Column(
                children: [
                  TextsInOnboarding(
                    text1: 'Convenience',
                    text2:
                        'Control your home devices using a single app from anywhere in the world',
                  ),
                const  SizedBox(height: 20,),
                  ButtonAndIndicators()
                ],
                        ),
              ),
            ),
          )
       
    
        // المحتوى فوق الخلفية
      ],
    );
  }
}

// ignore: camel_case_types
