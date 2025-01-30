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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             SizedBox(height: 25.h),
            Image.asset(
              Assets.imagesCameres,
              height: 270.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
              SizedBox(height: 25.h),
            Text(
              'Two Seater Luxury Sofa ',
              style: Textstyles.text1Inonboarding
                  .copyWith(color: Colors.black, fontSize: 20.sp),
            ),
            const SizedBox(height: 8),
            const PricesInDetailsProduct(oldPrice: '500', currentPrice: '400'),
            const SizedBox(height: 8),
            const NumberReviews(),
             const SizedBox(height: 8),
             Text('Minimal Sofa is made of by natural wood. The design' 
             'that is very simple and minimal. This is truly one of '
             'the best furnitures in any family for now. With 3 '
             'different colors, you can easily select the best match '
             'for your home. ',
              style: Textstyles.textitemcat.copyWith(fontWeight: FontWeight.w200)
                  ,),
             SizedBox(height: 25.h),
            const ButtonsInDetailsPage(),
          ],
        ),
      ),
    );
  }
}

