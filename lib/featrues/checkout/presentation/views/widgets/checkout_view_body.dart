import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/constants/images.dart';
import 'package:gradution/core/styles/textstyles.dart';
import 'package:gradution/core/widgets/custom_button.dart';
import 'package:gradution/core/widgets/custom_textfield.dart';
import 'package:gradution/featrues/checkout/presentation/views/widgets/drop_down_in_checkout.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});
  _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.grey[200],
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                 Text(
                  'Select a Payment Method',
                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                ListTile(
                  leading: SizedBox(width: 50.w ,child: Image.asset(Assets.imagesStripe)),
                  title:  Text('Stripe',style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                   leading: SizedBox(width: 50.w, child: Image.asset(Assets.imagesPaypal)),
                  title:  Text('Paypal',style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                 
                  leading: const Icon(Icons.cancel,),
                  title: const Text('Cancel'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

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
            CustomTextformfield(
              hintText: 'Enter Full Name',
              keyboardType: TextInputType.text,
              hintStyle: TextStyle(color: Color(0xff8F959E)),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text('Phone Number*', style: Textstyles.namereview),
            CustomTextformfield(
              hintText: '+20 123 456 7890',
              keyboardType: TextInputType.text,
              hintStyle: TextStyle(color: Color(0xff8F959E)),
            ),
            SizedBox(
              height: 20.h,
            ),
            const DropDownInCheckout(),
            SizedBox(
              height: 10.h,
            ),
            Text('Street Address*', style: Textstyles.namereview),
            SizedBox(height: 10.h),
            CustomTextformfield(
              hintText: 'Enter street address',
              keyboardType: TextInputType.text,
              hintStyle: TextStyle(color: Color(0xff8F959E)),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text('Postal Code*', style: Textstyles.namereview),
            CustomTextformfield(
              hintText: 'Enter postal code',
              keyboardType: TextInputType.text,
              hintStyle: TextStyle(color: Color(0xff8F959E)),
            ),
            SizedBox(
              height: 40.h,
            ),
            CustomButton(
              text: 'Confirm',
              onTap: () {
                _showBottomSheet(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
