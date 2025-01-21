import 'package:flutter/material.dart';
import 'package:gradution/core/routeing/routes.dart';
import 'package:gradution/core/styles/textstyles.dart';
import 'package:gradution/featrues/onbording/presentation/views/widgets/color_onboarding.dart';
import 'package:gradution/featrues/onbording/presentation/views/widgets/texts_in_onboarding.dart';


class BodyOnboarding extends StatelessWidget {
  final String text1;
  final String text2;
  final bool isVisible;
  final String image;
  const BodyOnboarding({
    super.key, required this.text1, required this.text2, required this.isVisible, required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(image,
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
                    text1: text1,
                    text2: text2,
                  ),
                ],
                        ),
              ),
            ),
          ),
            Visibility(
                visible: isVisible,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.login);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16, top: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Skip', style: Textstyles.text2Inonboarding.copyWith(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              )
      ],
    );
  }
}

