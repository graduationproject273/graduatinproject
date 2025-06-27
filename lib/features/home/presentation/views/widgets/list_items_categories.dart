import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution/core/routeing/routes.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/styles/textstyles.dart';
import 'package:gradution/depency_injection.dart';
import 'package:gradution/features/home/presentation/views/widgets/categories_item.dart';
import 'package:gradution/features/sellerDashboard/presentation/cubit/get_all_category_cubit/get_all_category_cubit.dart';

class ListItemsCategories extends StatefulWidget {
  const ListItemsCategories({super.key});

  @override
  State<ListItemsCategories> createState() => _ListItemsCategoriesState();
}

class _ListItemsCategoriesState extends State<ListItemsCategories>
    with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late AnimationController _buttonAnimationController;
  late Animation<double> _buttonScaleAnimation;

  @override
  void initState() {
    super.initState();
    _buttonAnimationController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );
    _buttonScaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(
        parent: _buttonAnimationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _buttonAnimationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToEnd() {
    _buttonAnimationController.forward().then((_) {
      _buttonAnimationController.reverse();
    });

    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<GetAllCategoryCubit>()..getAllcategoryfunction(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header مع تصميم محسن
            Container(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Categories',
                        style: Textstyles.namereview.copyWith(
                          color: maincolor,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Container(
                        height: 3.h,
                        width: 30.w,
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

            SizedBox(height: 16.h),

            // Categories List مع التحسينات
            SizedBox(
              height: 100.h,
              child: Row(
                children: [
                  // Categories ListView
                  Expanded(
                    child: BlocBuilder<GetAllCategoryCubit, GetAllCategoryState>(
                      builder: (context, state) {
                        if (state is GetAllCategorySuccess) {
                          return ListView.builder(
                            controller: _scrollController,
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            itemCount: state.categories.length,
                            padding: EdgeInsets.only(right: 8.w),
                            itemBuilder: (context, index) {
                              return AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                margin: EdgeInsets.only(right: 12.w),
                                child: GestureDetector(
                                  onTap: () {
                                    GoRouter.of(context).push(
                                      Routes.categories,
                                      extra: state.categories[index].id,
                                    );
                                  },
                                  child: TweenAnimationBuilder<double>(
                                    tween: Tween(begin: 0.0, end: 1.0),
                                    duration: Duration(
                                      milliseconds: 500 + (index * 100),
                                    ),
                                    curve: Curves.easeOutBack,
                                    builder: (context, value, child) {
                                      return Transform.scale(
                                        scale: value,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(16.r),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(0.08),
                                                blurRadius: 12,
                                                offset: Offset(0, 6),
                                                spreadRadius: 0,
                                              ),
                                            ],
                                          ),
                                          child: Categoriesitem(
                                            image: state.categories[index].image,
                                            text: state.categories[index].name,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          );
                        } else if (state is GetAllCategoyError) {
                          return _buildErrorWidget(state.error);
                        } else {
                          return _buildLoadingWidget();
                        }
                      },
                    ),
                  ),

                  SizedBox(width: 8.w),

                  // Enhanced Scroll Button
                  ScaleTransition(
                    scale: _buttonScaleAnimation,
                    child: Container(
                      height: 50.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                           maincolor,
                            maincolor.withOpacity(0.8),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(16.r),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF6B73FF).withOpacity(0.3),
                            blurRadius: 12,
                            offset: Offset(0, 6),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(16.r),
                          onTap: _scrollToEnd,
                          child: Container(
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 18.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
          width: 80.w,
          margin: EdgeInsets.only(right: 12.w),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(height: 8.h),
              Container(
                width: 50.w,
                height: 12.h,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(6.r),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildErrorWidget(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: Colors.red[50],
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.error_outline,
              color: Colors.red[400],
              size: 24.sp,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Unable to load categories',
            style: TextStyle(
              color: Colors.red[400],
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}