import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/core/styles/colors.dart';

class BuildCheckbox extends StatelessWidget {
  const BuildCheckbox({super.key, required this.title, required this.value, required this.onChanged});
  final String title;
  final bool value;
  final Function(bool) onChanged;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Checkbox(
          activeColor: maincolor,
          value: value,
          onChanged: (val) => onChanged(val ?? false),
        ),
        Text(
          title,
          style: TextStyle(fontSize: 16.sp),
        ),
      ],
    );
  }
}
