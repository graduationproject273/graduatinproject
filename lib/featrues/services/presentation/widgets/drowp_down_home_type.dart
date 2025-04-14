import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/styles/textstyles.dart';

class DrowpDownHomeType extends StatefulWidget {
  const DrowpDownHomeType({super.key, required this.options});
 final List<String> options;
  @override
  State<DrowpDownHomeType> createState() => _DrowpDownHomeTypeState();
}

class _DrowpDownHomeTypeState extends State<DrowpDownHomeType> {
  String? selectedValue;
 // List<String> options = ['House /Villa', 'Apartment', 'Chalet'];
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      focusColor: maincolor,
      // hint: Text("Home Type"),
      value: selectedValue,
      dropdownColor: Colors.white,
      borderRadius: BorderRadius.circular(10),
      icon: Icon(Icons.keyboard_arrow_down_rounded),
      iconSize: 30,
      isExpanded: true, // عشان العرض يكبر معاك
      style: TextStyle(color: Colors.black, fontSize: 18),
      items: widget.options.map((String value) {
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
      onChanged: (newValue) {
        setState(() {
          selectedValue = newValue;
        });
      },
    );
  }
}
