import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/core/databases/api/end_points.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/styles/textstyles.dart';
import 'package:gradution/depency_injection.dart';
import 'package:gradution/features/products/presentation/cubits/products_cubit/cubit/products_cubit.dart';
import 'package:gradution/features/products/presentation/view/widgets/product_item.dart';

class BestSelling extends StatefulWidget {
  const BestSelling({super.key});

  @override
  State<BestSelling> createState() => _BestSellingState();
}

class _BestSellingState extends State<BestSelling>
    with TickerProviderStateMixin {
  late AnimationController _headerAnimationController;
  late Animation<Offset> _headerSlideAnimation;

  @override
  void initState() {
    super.initState();
    _headerAnimationController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );
    _headerSlideAnimation = Tween<Offset>(
      begin: Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _headerAnimationController,
      curve: Curves.easeOutCubic,
    ));

    // بدء الأنيميشن
    _headerAnimationController.forward();
  }

  @override
  void dispose() {
    _headerAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProductsCubit>()..getProduct(EndPoints.products),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header محسن مع أنيميشن
            SlideTransition(
              position: _headerSlideAnimation,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8.w),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    maincolor,
                                    maincolor.withOpacity(0.5),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Icon(
                                Icons.local_fire_department_rounded,
                                color: maincolor,
                                size: 20.sp,
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Text(
                              'Best Selling',
                              style: Textstyles.namereview.copyWith(
                                color: maincolor,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Container(
                          margin: EdgeInsets.only(left: 44.w),
                          child: Text(
                            'Trending products this week',
                            style: TextStyle(
                              color: Color(0xFF9A9A9A),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Container(
                          margin: EdgeInsets.only(left: 44.w),
                          height: 3.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [maincolor, maincolor.withOpacity(0.5)],
                            ),
                            borderRadius: BorderRadius.circular(2.r),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16.h),

            // Products List محسن
            BlocBuilder<ProductsCubit, ProductsState>(
              builder: (context, state) {
                if (state is ProductsLoading) {
                  return _buildLoadingWidget();
                } else if (state is ProductsError) {
                  return _buildErrorWidget(state.message);
                } else if (state is ProductsLoaded) {
                  return SizedBox(
                    height: 280.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.only(left: 4.w),
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        final product = state.products[index];
                        return TweenAnimationBuilder<double>(
                          tween: Tween(begin: 0.0, end: 1.0),
                          duration: Duration(milliseconds: 600 + (index * 100)),
                          curve: Curves.easeOutBack,
                          builder: (context, value, child) {
                            return Transform.scale(
                              scale: value,
                              child: Container(
                                width: 160.w,
                                margin: EdgeInsets.only(right: 16.w),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.r),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.08),
                                      blurRadius: 20,
                                      offset: Offset(0, 8),
                                      spreadRadius: 0,
                                    ),
                                  ],
                                ),
                                child: ProductItem(productEntity: product),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  );
                } else {
                  return _buildEmptyWidget();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return SizedBox(
      height: 280.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            width: 160.w,
            margin: EdgeInsets.only(right: 16.w),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // صورة وهمية
                Container(
                  height: 120.h,
                  width: double.infinity,
                  margin: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color(0xFF6B73FF),
                      ),
                    ),
                  ),
                ),
                // نص وهمي
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 16.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Container(
                        height: 14.h,
                        width: 80.w,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(7.r),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Container(
                        height: 20.h,
                        width: 60.w,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildErrorWidget(String message) {
    return SizedBox(
      height: 280.h,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: Colors.red[50],
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.error_outline,
                color: Colors.red[400],
                size: 32.sp,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              'Unable to load products',
              style: TextStyle(
                color: Colors.red[400],
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Please try again later',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14.sp,
              ),
            ),
            SizedBox(height: 16.h),
            ElevatedButton(
              onPressed: () {
                context.read<ProductsCubit>().getProduct(EndPoints.products);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: maincolor,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                elevation: 0,
              ),
              child: Text(
                'Retry',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyWidget() {
    return SizedBox(
      height: 280.h,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.shopping_bag_outlined,
                color: Colors.grey[400],
                size: 32.sp,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              'No products available',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Check back later for new arrivals',
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
