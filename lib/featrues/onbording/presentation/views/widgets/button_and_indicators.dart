import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:gradution/core/styles/colors.dart';

class ButtonAndIndicators extends StatelessWidget {
  const ButtonAndIndicators({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DotsIndicator(
          dotsCount: 3,
          position: 0,
          decorator: DotsDecorator(
            activeColor: maincolor,
            color: Colors.grey,
            spacing: const EdgeInsets.all(2),
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
        SizedBox(
          width: 140,
          height: 35,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: maincolor,
              textStyle: const TextStyle(fontSize: 17),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
            ),
            child: Icon( Icons.arrow_forward_ios, color: Colors.white,),
          ),
        ),
      ],
    );
  }
}