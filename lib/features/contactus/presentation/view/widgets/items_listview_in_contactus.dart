import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/core/styles/extention.dart';
import 'package:gradution/features/contactus/presentation/view/widgets/item_in_contactus.dart';

class ItemsListviewInContactus extends StatelessWidget {
   ItemsListviewInContactus({super.key});
  final List<Widget> icon =[
   Icon(Icons.facebook_sharp,color: Colors.white,size: 30.sp,),
   Icon(CupertinoIcons.mail,color: Colors.white,size: 30.sp,),
    Icon(CupertinoIcons.phone,color: Colors.white,size: 30.sp,)
  ];
  final List<String> text1 =[
    'Facebook',
    'Email',
    'Phone'
  ];
  final List<String> text2 =[
    '@gradution',
    '4V2d0@example.com',
    'Available 24/7'
  ];
  @override
  Widget build(BuildContext context) {
   return  SizedBox(
        height: context.height*.4,
        child: ListView.builder(
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(bottom: 11.0),
            child: ItemInContactus(
              icon: icon[index],
              text1: text1[index],
              text2: text2[index],
            ),
          ),
           itemCount: 3,),
    
    );
  }
}