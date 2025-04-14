import 'package:flutter/material.dart';
import 'package:gradution/core/styles/textstyles.dart';

class TextInCheckbox extends StatelessWidget {
  const TextInCheckbox({
    super.key, required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Textstyles.namereview.copyWith(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}