import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/constants/images.dart';
import 'package:gradution/featrues/products/presentation/view/widgets/buttons_in_details_page.dart';

class ProductsDetailsViewBody extends StatelessWidget {
  const ProductsDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.0.h,vertical: 10.w),
        child: Column(
          children: [
            Image.asset(Assets.imagesCameres,fit: BoxFit.cover, height: 300.h,width: 300.w, ),
            ButtonsInDetailsPage(),
          ],
        ),
      ),
    );
  }
}