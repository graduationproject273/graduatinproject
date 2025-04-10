import 'package:flutter/material.dart';
import 'package:gradution/constants/images.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(Assets.imagesModifylogo);
  }
}
