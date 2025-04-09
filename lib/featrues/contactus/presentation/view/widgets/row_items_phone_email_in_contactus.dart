import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/core/styles/extention.dart';
import 'package:gradution/featrues/contactus/presentation/view/widgets/item_phone_and_email_in_conactus.dart';

class RowItemPhoneEmailInContactus extends StatelessWidget {
  const RowItemPhoneEmailInContactus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.width * .45,  
      child:  ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
     itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding:  EdgeInsets.only(right: 20.w),
            child: ItemPhoneAndEmailInConactus(
            text1: index == 0 ? 'Call us' : 'Email us',
            text2: index == 0
                ? 'Our team is on the line \nMon-Fri  •  9-17'
                : 'Our team is online \nMon-Fri  •  9-17',
            icon: index == 0
                ?  Icon(CupertinoIcons.phone,color: Colors.white,size: 30.sp,)
                : Icon(CupertinoIcons.mail,color: Colors.white,size: 30.sp,),
                    ),
          ) ;
        },
      ),
    );

  }
}
