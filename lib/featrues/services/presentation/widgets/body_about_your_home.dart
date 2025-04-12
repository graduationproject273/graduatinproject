import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/widgets/custom_textfield.dart';
import 'package:gradution/featrues/services/presentation/widgets/drop_down_date.dart';
import 'package:gradution/featrues/services/presentation/widgets/drowp_down_home_type.dart';

class BodyAboutYourHome extends StatelessWidget {
  const BodyAboutYourHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ColumnTextDrowpDown(
              text: 'Home Type *',
              options: ['House /Villa', 'Apartment', 'Chalet'],
            ),
            SizedBox(
              height: 30.h,
            ),
            ColumnTextDrowpDown(
              text: 'Home Status*',
              options: ['Finished', 'Under Construct'],
            ),
            SizedBox(
              height: 30.h,
            ),
            ColumnTextDrowpDown(
              text: 'Home Size*',
              options: [
                'less than 100 m2',
                'between 100 and 200 m2',
                'between 200 and 300 m2',
                'between 300 and 400 m2'
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              'Number of levels*',
              style: TextStyle(fontSize: 16.sp, color: Colors.black),
            ),
            CustomTextformfield(
              hintText: 'i.e 2 floors',
              keyboardType: TextInputType.number,
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: maincolor,
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              'Number of rooms*',
              style: TextStyle(fontSize: 16.sp, color: Colors.black),
            ),
            CustomTextformfield(
              hintText: 'i.e 2 rooms',
              keyboardType: TextInputType.number,
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: maincolor,
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              'Installation date*',
              style: TextStyle(fontSize: 16.sp, color: Colors.black),
            ),
            DropdownDatePicker(),
          ],
        ),
      ),
    );
  }
}

class ColumnTextDrowpDown extends StatelessWidget {
  const ColumnTextDrowpDown({
    super.key,
    required this.text,
    required this.options,
  });
  final String text;
  final List<String> options;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 16.sp, color: Colors.black),
        ),
        DrowpDownHomeType(
          options: options,
        ),
      ],
    );
  }
}
