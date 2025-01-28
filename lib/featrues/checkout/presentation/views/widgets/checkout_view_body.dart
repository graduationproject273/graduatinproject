import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/core/styles/textstyles.dart';
import 'package:gradution/core/widgets/custom_button.dart';
import 'package:gradution/core/widgets/custom_textfield.dart';
import 'package:gradution/featrues/checkout/presentation/views/widgets/drop_down_in_checkout.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Text('Name', style: Textstyles.namereview),
              SizedBox(height: 10.h),
              CustomTextformfield(hintText: 'Enter Full Name', 
              keyboardType: TextInputType.text, hintStyle: TextStyle(color: Color(0xff8F959E)),  
              ),
              SizedBox(height: 10.h,),
              Text('Phone Number*', style: Textstyles.namereview),
                CustomTextformfield(hintText: '+20 123 456 7890', 
              keyboardType: TextInputType.text, hintStyle: TextStyle(color: Color(0xff8F959E)),  
              ),
              SizedBox(height: 20.h,),
             const DropDownInCheckout(),
              SizedBox(height: 10.h,),
               Text('Street Address*', style: Textstyles.namereview),
              SizedBox(height: 10.h),
              CustomTextformfield(hintText: 'Enter street address', 
              keyboardType: TextInputType.text, hintStyle: TextStyle(color: Color(0xff8F959E)),  
              ),
              SizedBox(height: 10.h,),
              Text('Postal Code*', style: Textstyles.namereview),
                CustomTextformfield(hintText: 'Enter postal code', 
              keyboardType: TextInputType.text, hintStyle: TextStyle(color: Color(0xff8F959E)),  
              ),
              SizedBox(height: 40.h,),
              CustomButton(text: 'Confirm'),
          ],
        ),
      ),
    );
  }
}