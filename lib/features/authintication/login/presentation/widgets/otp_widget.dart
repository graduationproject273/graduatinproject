import 'package:flutter/material.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/styles/textstyles.dart';
import 'package:gradution/core/widgets/custom_button.dart';
import 'package:gradution/features/authintication/typeUser/presentation/views/widgets/image_widget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpWidget extends StatelessWidget {
  const OtpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text('Verify Email', style: Textstyles.texttitlelogin),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            ImageWidget(),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Enter OTP here', style: Textstyles.namereview,)),
            const SizedBox(height: 40),
            PinCodeTextField(appContext: context, length: 6,
              onChanged: (value) {},
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(10),
                fieldHeight: 50,
                fieldWidth: 40,
                activeFillColor: Colors.white,
                inactiveFillColor: Colors.white,
                selectedFillColor: Colors.white,
                activeColor: maincolor,
                inactiveColor: Colors.grey,
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 50),
           CustomButton(text: 'Verify',
            textcolor: Colors.white,    
           onTap: () {
             
           },),
          ],
        ),
      )),
    );
  }
}