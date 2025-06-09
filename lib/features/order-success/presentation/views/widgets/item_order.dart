import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/constants/images.dart';
import 'package:gradution/core/styles/extention.dart';

// ignore: camel_case_types
class itemOrder extends StatelessWidget {
  const itemOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: .1.sh,
      width: double.infinity,
      child: Row(
        children: [
         Image.asset(Assets.imagesSmartlighting),
          SizedBox(width: 16.w,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width :context.width*.55 ,child: Text('Lacoste Sport Top / Bershka Ski...',style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w600,overflow: TextOverflow.ellipsis),)),
              Text('2 products - Shipped on Feb 12',style  : TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w400,color: Colors.grey),),
            ],
          ),
         ],
      )
    );
  }
}
