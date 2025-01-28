import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/styles/textstyles.dart';
import 'package:gradution/core/widgets/custom_button.dart';
import 'package:gradution/core/widgets/custom_textfield.dart';
import 'package:gradution/featrues/reviews/presentation/view/widgets/custom_appbar.dart';

class ReviewsViewBody extends StatefulWidget {
  const ReviewsViewBody({super.key});

  @override
  State<ReviewsViewBody> createState() => _ReviewsViewBodyState();
}

class _ReviewsViewBodyState extends State<ReviewsViewBody> {
  double _rating = 0.0; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
       appBar: CustomAppBar(title: 'Add Review',),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width, // تحديد العرض الأقصى
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(20),
              vertical: ScreenUtil().setHeight(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name', style: Textstyles.namereview),
                SizedBox(height: ScreenUtil().setHeight(10)),
                CustomTextformfield(
                  hintText: 'Type your name',
                  keyboardType: TextInputType.text,
                  hintStyle: TextStyle(color: Color(0xff8F959E)),
                ),
                SizedBox(height: ScreenUtil().setHeight(20)),
                Text('How was your experience ?', style: Textstyles.namereview),
                SizedBox(height: ScreenUtil().setHeight(10)),
                CustomTextformfield(
                  hintText: 'Describe your experience',
                  keyboardType: TextInputType.text,
                  maxLines: 7,
                  cursorHeight: ScreenUtil().setHeight(60),
                  hintStyle: TextStyle(color: Color(0xff8F959E)),
                ),
                SizedBox(height: ScreenUtil().setHeight(20)),
                Text('Star', style: Textstyles.namereview),
                SizedBox(height: ScreenUtil().setHeight(10)),
                // عرض القيمة العشرية بجانب Slider
                Row(
                  children: [
                    Expanded(   
                      child: Slider(
                        value: _rating,
                        min: 0.0, 
                        max: 5.0,  
                        label: '${_rating.toStringAsFixed(1)} Stars',
                        onChanged: (value) {
                          setState(() {
                            _rating = value; 
                          });
                        },
                        activeColor: Color(0xfff9fafa),
                        inactiveColor: Color(0xFFF9FAFA),
                        thumbColor: maincolor,
                      ),
                    ),
                    SizedBox(width: ScreenUtil().setWidth(10)),  
                    Text(
                      _rating.toStringAsFixed(1),   
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(16),
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: ScreenUtil().setHeight(50)),
                CustomButton( text: 'Submit Review',onTap: () {} ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}