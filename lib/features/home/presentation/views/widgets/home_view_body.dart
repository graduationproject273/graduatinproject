import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/styles/textstyles.dart';
import 'package:gradution/features/home/presentation/views/home_view.dart';
import 'package:gradution/features/home/presentation/views/widgets/best_selling.dart';
import 'package:gradution/features/home/presentation/views/widgets/container_drawder.dart';
import 'package:gradution/features/home/presentation/views/widgets/custom_appbar_inhome.dart';
import 'package:gradution/features/home/presentation/views/widgets/landing_video.dart';
import 'package:gradution/features/home/presentation/views/widgets/list_items_categories.dart';

// ignore: camel_case_types
class homeViewBody extends StatelessWidget {
  const homeViewBody({
    super.key,
    required this.widget,
  });

  final HomeView widget;

  @override
  Widget build(BuildContext context) {
    return SliderDrawer(
      key: widget.sliderKey,
      isDraggable: false,
      animationDuration: 500,
      slider: Containerindrawer(),
      appBar: CustomAppbarInhome(drawerKey: widget.sliderKey),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.grey[50]!,
              Colors.white,
              Colors.grey[50]!,
            ],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Hero Section
              Container(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 800),
                      child: ShaderMask(
                        shaderCallback: (bounds) => LinearGradient(
                          colors: [
                            maincolor,
                            maincolor.withOpacity(0.5),
                          ],
                        ).createShader(bounds),
                        child: Text(
                          'Smart Home\nfor your lifestyle',
                          style: Textstyles.text3Inonboarding.copyWith(
                            fontSize: 28.sp,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Transform your living space with intelligent solutions',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),

              // Video Section with Enhanced Design
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 20,
                      offset: Offset(0, 10),
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25.r),
                  child: Container(
                    height: 200.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF667eea),
                          Color(0xFF764ba2),
                        ],
                      ),
                    ),
                    child: Stack(
                      children: [
                        LandingVideoScreen(),
                        // Overlay gradient for better text visibility
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.3),
                              ],
                            ),
                          ),
                        ),
                        // Play button overlay
                        Positioned(
                          bottom: 16.h,
                          right: 16.w,
                          child: Container(
                            padding: EdgeInsets.all(8.w),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.9),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 8,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.play_arrow,
                              color: Color(0xFF6B73FF),
                              size: 20.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 32.h),

              // Categories Section
              const ListItemsCategories(),

              SizedBox(height: 32.h),

              // Best Selling Section
              const BestSelling(),

              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}