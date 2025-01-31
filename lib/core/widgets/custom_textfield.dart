// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gradution/core/styles/colors.dart';

class CustomTextformfield extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
 final  bool? obscureText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final String? Function(String?)? onSaved;
  final int? maxLines;
  final double? cursorHeight;
  final TextStyle? hintStyle;
  const CustomTextformfield({
    super.key,
    required this.hintText,
    required this.keyboardType,
    this.obscureText,
    this.suffixIcon,
    this.validator,
    this.onSaved, this.maxLines, this.cursorHeight, this.hintStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      onSaved: onSaved,
      keyboardType: keyboardType,
      validator: validator,
      cursorHeight: cursorHeight,
      cursorColor: maincolor,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintStyle:hintStyle ,
        suffixIcon: suffixIcon,
        suffixIconColor: Color(0xFFC9CECF),
        hintText: hintText,
        filled: true,
        fillColor: colortextfieldreveiw,
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
    ));
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: Color(0xFFF9FAFA)),
        borderRadius: BorderRadius.circular(4),
      );
  }
}