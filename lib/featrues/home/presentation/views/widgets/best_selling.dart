import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/core/styles/textstyles.dart';
import 'package:gradution/featrues/products/presentation/view/widgets/product_item.dart';

class BestSelling extends StatelessWidget {
  const BestSelling({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min, 
      crossAxisAlignment: CrossAxisAlignment.start,  
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w), // إضافة هامش للعناصر
          child: Text(
            'Best Selling',
            style: Textstyles.namereview.copyWith(color: Color(0xFF9A9A9A)),
          ),
        ),
        SizedBox(height: 20.h),
        SizedBox(
          height: 240.h, // تحديد ارتفاع مناسب
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true, 
            padding: EdgeInsets.symmetric(horizontal: 16.w), // إضافة هامش جانبي
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 10.w), 
                child: SizedBox(
                  width: 140.w, 
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10.h),
                    child: ProductItem()), 
                ),
              );
            },
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
