import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/features/contactus/presentation/view/widgets/items_listview_in_contactus.dart';
import 'package:gradution/features/contactus/presentation/view/widgets/row_items_phone_email_in_contactus.dart';

class ContactusView extends StatelessWidget {
  const ContactusView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 20.h,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RowItemPhoneEmailInContactus(),
              ItemsListviewInContactus(),
            ],
          ),
        ),
      ),
    );
  }
}
