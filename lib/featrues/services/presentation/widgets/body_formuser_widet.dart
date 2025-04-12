import 'package:flutter/material.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/styles/textstyles.dart';
import 'package:gradution/core/widgets/custom_textfield.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class BodyFormuserWidet extends StatelessWidget {
  const BodyFormuserWidet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextformfield(hintText:'First Name*' ,hintStyle: Textstyles.namereview.copyWith(color: Colors.grey, fontSize: 15), keyboardType: TextInputType.text, color: Colors.white,border: UnderlineInputBorder(
        borderSide: BorderSide(
          width: 2,
          color: maincolor,
        ),
            ),),
            const SizedBox(height: 20),
            CustomTextformfield(hintText: 'Last Name*',hintStyle: Textstyles.namereview.copyWith(color: Colors.grey, fontSize: 15), keyboardType: TextInputType.emailAddress, color: Colors.white,border: UnderlineInputBorder(
        borderSide: BorderSide(
          width: 2,
          color: maincolor,
        ),
            ),),
            const SizedBox(height: 20),
        IntlPhoneField(
          decoration: InputDecoration(
            labelText: 'Mobile',
            hintStyle: Textstyles.namereview.copyWith(
        color: Colors.grey,
        fontSize: 15,
            ),
            border: UnderlineInputBorder(
        borderSide: BorderSide(
          width: 2,
          color: maincolor,
        ),
            ),
            focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          width: 2,
          color: maincolor,
        ),
            ),
          ),
          dropdownDecoration: BoxDecoration(
            color: Colors.white, // الخلفية البيضاء للقائمة المنسدلة
          ),
          initialCountryCode: 'EG',
          onChanged: (phone) {
            print(phone.completeNumber);
          },
        ),
        
            const SizedBox(height: 20),
            CustomTextformfield(hintText: 'Email*',hintStyle:   Textstyles.namereview.copyWith(color: Colors.grey, fontSize: 15), keyboardType: TextInputType.visiblePassword, obscureText: true, color: Colors.white,
            border: UnderlineInputBorder(
        borderSide: BorderSide(
          width: 2,
          color: maincolor,
        ),
            ),
            ),
            const SizedBox(height: 20),
            CustomTextformfield(hintText: 'Address*',hintStyle:   Textstyles.namereview.copyWith(color: Colors.grey, fontSize: 15), keyboardType: TextInputType.visiblePassword, obscureText: true, color: Colors.white
            ,border: UnderlineInputBorder(
        borderSide: BorderSide(
          width: 2,
          color: maincolor,
        ),
        
            ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Share with us your requirements*',style: Textstyles.namereview.copyWith(color: Colors.grey, fontSize: 15),),
              ],
            ),
            const SizedBox(height: 20),
            
            CustomTextformfield(hintText: 'i.e I Wanna make my home smart',hintStyle: Textstyles.namereview.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 15,
            ), keyboardType: TextInputType.text,
            maxLines: 5,
            colorborder: maincolor,
            )
          ],
        ),
      ),
    );
  }
}