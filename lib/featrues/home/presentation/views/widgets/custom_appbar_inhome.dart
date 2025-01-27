import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

class CustomAppbarInhome extends StatefulWidget {
  const CustomAppbarInhome({super.key, required this.drawerKey});

  final GlobalKey<SliderDrawerState> drawerKey;

  @override
  State<CustomAppbarInhome> createState() => _CustomAppbarInhomeState();
}

class _CustomAppbarInhomeState extends State<CustomAppbarInhome>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isDraweropen = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onDrawerTap() {
    setState(() {
      isDraweropen = !isDraweropen;
      if (isDraweropen) {
        _controller.forward();
        widget.drawerKey.currentState?.openSlider();
      } else {
        _controller.reverse();
        widget.drawerKey.currentState?.closeSlider();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // خلفية الـ AppBar
      child: SizedBox(
        height: 80.h, // ارتفاع الـ AppBar متجاوب
        child: Padding(
          padding: EdgeInsets.only(top: 20.h), // مسافة علوية متجاوبة
          child: Row(
            children: [
              IconButton(
                onPressed: onDrawerTap,
                icon: AnimatedIcon(
                  icon: AnimatedIcons.menu_close,
                  progress: _controller,
                  size: 30.sp, // حجم الأيقونة متجاوب
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}