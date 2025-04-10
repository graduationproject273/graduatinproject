import 'package:flutter/material.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/featrues/authintication/typeUser/presentation/views/widgets/usertype_view_body.dart';

class UserTypeRadio extends StatelessWidget {
  final UserType userType;
  final String title;
  final UserType? selectedUserType;
  final ValueChanged<UserType?> onChanged;

  const UserTypeRadio({
    super.key,
    required this.userType,
    required this.title,
    required this.selectedUserType,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: maincolor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: RadioListTile<UserType>(
        activeColor: Colors.white,
        title: Text(title, style: TextStyle(color: Colors.white)),
        value: userType,
        groupValue: selectedUserType,
        onChanged: onChanged,
      ),
    );
  }
}
