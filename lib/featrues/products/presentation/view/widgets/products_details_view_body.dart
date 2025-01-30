import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/constants/images.dart';
import 'package:gradution/core/styles/textstyles.dart';
import 'package:gradution/featrues/products/presentation/view/widgets/buttons_in_details_page.dart';
import 'package:gradution/featrues/products/presentation/view/widgets/number_reviews.dart';
import 'package:gradution/featrues/products/presentation/view/widgets/prices_in_details_product.dart';

class ProductsDetailsViewBody extends StatelessWidget {
  const ProductsDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(Assets.imagesCameres,fit: BoxFit.cover, width: 300.w,height: 300.h,)),
            const SizedBox(height: 20,),
             Text('Top Camera in smarthome',style: Textstyles.text1Inonboarding.copyWith(
              color: Colors.black,fontSize: 20.sp
             ),),
            const SizedBox(height: 20,),
            NumberReviews(),
            const SizedBox(height: 20,),
            PricesInDetailsProduct(oldPrice: '100', currentPrice: '60'),
            const SizedBox(height: 10,),
            Text('This camera is the top camera in the smart home system, it has a high resolution and a wide angle of view, it is also equipped with night vision and motion detection.',style: Textstyles.textitemcat.copyWith(
              color: Colors.black,fontWeight: FontWeight.w200
             ),),
            const SizedBox(height: 20,),
            const ButtonsInDetailsPage(),
          ],
        ),
      ),
    );
  }
}

