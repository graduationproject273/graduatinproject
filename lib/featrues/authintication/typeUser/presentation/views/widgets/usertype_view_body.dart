import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/featrues/authintication/typeUser/presentation/views/widgets/app_bar.dart';
import 'package:gradution/featrues/authintication/typeUser/presentation/views/widgets/continue_button.dart';
import 'package:gradution/featrues/authintication/typeUser/presentation/views/widgets/image_widget.dart';
import 'package:gradution/featrues/authintication/typeUser/presentation/views/widgets/select_user_type_text.dart';
import 'package:gradution/featrues/authintication/typeUser/presentation/views/widgets/user_type_radio.dart';

enum UserType { regular, seller }

class UsertypeViewBody extends StatefulWidget {
  const UsertypeViewBody({super.key});

  @override
  State<UsertypeViewBody> createState() => _UsertypeViewBodyState();
}

class _UsertypeViewBodyState extends State<UsertypeViewBody> {
  UserType? _selectedUserType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWidget(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
          child: Column(
            children: [
              const ImageWidget(),
              const SelectUserTypeText(),
              SizedBox(height: 50.h),
              UserTypeRadio(
                userType: UserType.regular,
                title: 'Regular User',
                selectedUserType: _selectedUserType,
                onChanged: (UserType? value) {
                  setState(() {
                    _selectedUserType = value;
                  });
                },
              ),
              SizedBox(height: 10.h),
              UserTypeRadio(
                userType: UserType.seller,
                title: 'Seller',
                selectedUserType: _selectedUserType,
                onChanged: (UserType? value) {
                  setState(() {
                    _selectedUserType = value;
                  });
                },
              ),
              SizedBox(height: 20.h),
              ContinueButton(selectedUserType: _selectedUserType),
            ],
          ),
        ),
      ),
    );
  }
}
