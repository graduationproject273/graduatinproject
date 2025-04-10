import 'package:flutter/material.dart';
import 'package:gradution/featrues/authintication/sinup/presentation/widgets/section_text_and_image_in_sinup.dart';
import 'package:gradution/featrues/authintication/sinup/presentation/widgets/section_textfiled_and_button_in_sinup.dart';

class SinupBodyView extends StatelessWidget {
  const SinupBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              const SizedBox(height: 40),
              const SectionTextAndImageInSinup(),
              const SizedBox(height: 40),
              const SectionTextFiledAndButtoninSinup(),
            ])));
  }
}
