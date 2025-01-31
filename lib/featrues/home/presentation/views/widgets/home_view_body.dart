// ignore: camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:gradution/core/styles/textstyles.dart';
import 'package:gradution/featrues/home/presentation/views/home_view.dart';
import 'package:gradution/featrues/home/presentation/views/widgets/best_selling.dart';
import 'package:gradution/featrues/home/presentation/views/widgets/container_drawder.dart';
import 'package:gradution/featrues/home/presentation/views/widgets/custom_appbar_inhome.dart';
import 'package:gradution/featrues/home/presentation/views/widgets/landing_video.dart';
import 'package:gradution/featrues/home/presentation/views/widgets/list_items_categories.dart';

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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 30.h,
          //  mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              /// The landing video.
              ///
              /// The video is displayed in a [SizedBox] with a height and width of
              /// 300 pixels.
              /// 
             Text('Smart Home for your home',style:Textstyles.text3Inonboarding.copyWith(fontSize: 22.sp)),
              ClipRRect(
                //clipBehavior: Clip.values[1],
                borderRadius: BorderRadius.circular(30),
                child: SizedBox(
                  height: 180.h,
                  width: double.infinity,
                  child: LandingVideoScreen()),
              ),
           
              const ListItemsCategories(),
              const  BestSelling()
            ],
          ),
        ),
      ),
    );
  }
}

