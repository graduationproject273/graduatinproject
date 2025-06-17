import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/core/styles/textstyles.dart';
import 'package:gradution/depency_injection.dart';
import 'package:gradution/features/products/presentation/cubits/products_cubit/cubit/products_cubit.dart';
import 'package:gradution/features/products/presentation/view/widgets/product_item.dart';

class BestSelling extends StatelessWidget {
  const BestSelling({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProductsCubit>()..getProduct(),
      child: Column(
        //spacing: 10.h,
        //mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Best Selling',
            style: Textstyles.namereview.copyWith(color: Color(0xFF9A9A9A)),
          ),
          BlocBuilder<ProductsCubit, ProductsState>(
            builder: (context, state) {
              if (state is ProductsLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is ProductsError) {
                return Center(child: Text('Error: ${state.message}'));
              } else if (state is ProductsLoaded) {
                // هنا يمكنك استخدام state.products لعرض العناصر
                return SizedBox(
                  height: 240.h, // تحديد ارتفاع مناسب
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(right: 16.w), // إضافة هامش جانبي
                    itemBuilder: (context, index) {
                      final product = state.products[index];
                      return Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: Container(
                          width: 140.w,
                          margin: EdgeInsets.symmetric(vertical: 10.h),
                          child: ProductItem(productEntity: product),
                        ),
                      );
                    },
                    itemCount: state.products.length,
                  ),
                );
              } else {
                // حالة افتراضية في حال لم يكن هناك حالة محددة
                return Center(child: Text('No products available'));
              }
            },
          ),
        ],
      ),
    );
  }
}
