import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution/core/routeing/routes.dart';

class AppberInProduct extends AppBar {
  
   AppberInProduct( {super.key, required String title , required BuildContext context  , required Icon icon})
      : super(
        backgroundColor: Colors.white,
          title: Text(title, style:  TextStyle(fontSize: 25.sp, color: Colors.black,fontWeight: FontWeight.bold)),
          actions: [
            IconButton(
              onPressed: () {
GoRouter.of(context).push(Routes.cart); 
              },
              icon:  icon,
            ),
          ],
        );
}
  