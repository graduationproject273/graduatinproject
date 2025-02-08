import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/core/styles/colors.dart';

class ItemInContactus extends StatelessWidget {
  const ItemInContactus({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    final screenhight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenwidth*.9,
      height: screenhight*.15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: maincolor,width: 2),
              ),
      child: Row(
        children: [
          Container(
            width: screenwidth*.2,
            height: screenhight*.15,
            decoration: BoxDecoration(
              color: maincolor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset(image),
            ),
          SizedBox(width: screenwidth*.05,),
          Column(
            children: [
              Text('Instagram',style: TextStyle(color: maincolor,fontSize: 20.sp,fontWeight: FontWeight.bold),),
            ],
          )
        ],
      ),
    );
  }
}