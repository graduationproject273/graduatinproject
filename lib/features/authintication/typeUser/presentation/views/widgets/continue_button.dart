import 'package:flutter/material.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/widgets/custom_button.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution/core/routeing/routes.dart';
import 'package:gradution/features/authintication/typeUser/presentation/views/widgets/usertype_view_body.dart';

class ContinueButton extends StatelessWidget {
  final UserType? selectedUserType;

  const ContinueButton({super.key, required this.selectedUserType});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'Continue',
      buttonbodycolor: Colors.white,
      textcolor: maincolor,
      onTap: () {
        if (selectedUserType != null) {
          if (selectedUserType == UserType.regular) {
            GoRouter.of(context).push(Routes.login);
          } else {
            GoRouter.of(context).push(Routes.register);
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Please select a user type')),
          );
        }
      },
    );
  }
}
