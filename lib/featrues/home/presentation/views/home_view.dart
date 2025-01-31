import 'package:flutter/material.dart';


import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

import 'package:gradution/featrues/home/presentation/views/widgets/container_drawder.dart';
import 'package:gradution/featrues/home/presentation/views/widgets/custom_appbar_inhome.dart';

import 'package:gradution/featrues/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.sliderKey});
  final GlobalKey<SliderDrawerState> sliderKey;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SliderDrawer(
       key: widget.sliderKey,
       isDraggable: false,
       animationDuration: 500,
       slider: Containerindrawer(),
       appBar: CustomAppbarInhome(drawerKey: widget.sliderKey),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /// The landing video.
            ///
            /// The video is displayed in a [SizedBox] with a height and width of
            /// 300 pixels.
         /*   SizedBox(
              height: 300,
              width: double.infinity,
              child: LandingVideoScreen(),
            ),*/
ListItemsCategories()
          ],
        ),
      ),
    );
  }
}
