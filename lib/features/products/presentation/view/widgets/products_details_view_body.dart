import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/core/styles/extention.dart';
import 'package:gradution/core/styles/textstyles.dart';
import 'package:gradution/features/products/domain/entities/product_entity.dart';
import 'package:gradution/features/products/presentation/view/widgets/buttons_in_details_page.dart';
import 'package:gradution/features/products/presentation/view/widgets/number_reviews.dart';
import 'package:gradution/features/products/presentation/view/widgets/prices_in_details_product.dart';

class ProductsDetailsViewBody extends StatelessWidget {
  const ProductsDetailsViewBody({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        children: [
        Positioned.fill(child: Container(
          height: context.height,
        )),
          SingleChildScrollView(
            child: SizedBox(
              height: context.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 25.h),
                  Image.network(
                   productEntity.image !,
                    height: 300.h,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(height: 25.h),
                  Text(
                    productEntity.name,
                    style: Textstyles.text1Inonboarding
                        .copyWith(color: Colors.black, fontSize: 20.sp),
                  ),
                  const SizedBox(height: 8),
                   PricesInDetailsProduct(oldPrice: productEntity.price.toString(), currentPrice: productEntity.price.toString()),
                  const SizedBox(height: 8),
                  const NumberReviews(),
                  const SizedBox(height: 8),
                  Text(
                    productEntity.description,
                    style:
                        Textstyles.textitemcat.copyWith(fontWeight: FontWeight.w200),
                  ),
                  SizedBox(height: 25.h),
                 
                ],
              ),
            ),
          ),
           Positioned(
            right: 0,
            bottom: 0,
            child: ButtonsInDetailsPage(productentity: productEntity,)),
        ],
      ),
    );
  }
}
