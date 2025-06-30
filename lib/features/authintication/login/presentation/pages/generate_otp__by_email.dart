import 'package:flutter/material.dart';
import 'package:gradution/features/authintication/login/presentation/widgets/body_otp_view.dart';

class GenerateOTPByEmail extends StatelessWidget {
  const GenerateOTPByEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        
        backgroundColor: Colors.white,
        body:BodyOTPView()
      ),
    );
  }
}