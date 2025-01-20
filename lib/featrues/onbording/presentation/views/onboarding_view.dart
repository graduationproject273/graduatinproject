import 'package:flutter/material.dart';

import 'package:gradution/constants/images.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
      
          Image.asset(Assets.imagesOnboardingimagethird,
          width: double.infinity,
          height: double.infinity
          ,
          fit: BoxFit.cover,),

          
           Positioned(
            bottom: 0,
             child: Container(
                width: MediaQuery.of(context).size.width, 
                height: MediaQuery.of(context).size.height ,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent, // لون أغمق
                      Colors.black, // شفاف
                    ],
                    begin: Alignment.topCenter, // يبدأ من الأعلى
                    end: Alignment.bottomCenter, // ينتهي في الأسفل
                  ),
                ),
              ),
           ),
         

          // المحتوى فوق الخلفية
        ],
      ),
    );
  }
}
