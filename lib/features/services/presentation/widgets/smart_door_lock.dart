import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/widgets/custom_button.dart';
import 'package:gradution/core/widgets/custom_textfield.dart';
import 'package:gradution/features/services/presentation/widgets/drowp_down_home_type.dart';

class SmartDoorLock extends StatelessWidget {
  const SmartDoorLock({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
              'Type nof locks*',
              style: TextStyle(fontSize: 16.sp, color: Colors.black),
            ),
          DrowpDownHomeType(options: ["wood", "material","glass"],),
            SizedBox(
              height: 10.h,
            ),
           Text(
              'Number of locks*',
              style: TextStyle(fontSize: 16.sp, color: Colors.black),
            ),
      
            CustomTextformfield(
              hintText: 'i.e 2 locks',
              keyboardType: TextInputType.number,
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: maincolor,
                ),)), 
            SizedBox(
              height: 10.h,
            ),
            CustomButton(text: '+ upload Door photo '),
        ],
      ),
    );
  }
}