import 'package:flutter/material.dart';
import 'package:gradution/features/authintication/login/presentation/widgets/column_text_and_image_login.dart';
import 'package:gradution/features/authintication/login/presentation/widgets/section_textfiled_and_button.dart';

class BodyOTPView extends StatelessWidget {
  const BodyOTPView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const ColumnTextAndImageLogin(),

            const SizedBox(height: 40),
            const SectionTextFiledAndButton(),

            // Add your login form here
            // For example, you can use TextFormField for email and password inputs
          ],
        ),
      ),
    );
  }
}
