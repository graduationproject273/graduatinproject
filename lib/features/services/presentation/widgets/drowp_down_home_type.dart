import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/core/styles/colors.dart';

class DrowpDownHomeType extends StatelessWidget {
  final List<String> options;
  final String? value;
  final void Function(String?) onChanged;

  const DrowpDownHomeType({
    super.key,
    required this.options,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      focusColor: maincolor,
      value: (value != null && value!.isNotEmpty && options.contains(value)) ? value : null,
      hint: const Text("Select option"),
      dropdownColor: Colors.white,
      borderRadius: BorderRadius.circular(10),
      icon: const Icon(Icons.keyboard_arrow_down_rounded),
      iconSize: 30,
      isExpanded: true,
      style: const TextStyle(color: Colors.black, fontSize: 18),
      items: options.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.black,
            ),
          ),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}