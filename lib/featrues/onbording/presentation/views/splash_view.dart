import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/constants/images.dart';
import 'package:gradution/core/routeing/routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // إعداد AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    )..repeat(reverse: true); // تكرار الحركة بشكل مستمر

    // إعداد Animation
    _animation = Tween<double>(begin: 100, end: 300).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // بدء الانتقال بعد مدة
    Future.delayed(Duration(seconds: 5), () {
      // الانتقال إلى الصفحة التالية
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, Routes.onBoarding);
    });
  }

  @override
/// Disposes the animation controller to free up resources when the widget is removed from the widget tree.

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  // الدائرة الأولى
                  Container(
                    width: _animation.value,
                    height: _animation.value,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // ignore: deprecated_member_use
                      color: Colors.blue.withOpacity(0.2),
                    ),
                  ),
                  // الدائرة الثانية
                  Container(
                    width: _animation.value * 0.7,
                    height: _animation.value * 0.7,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // ignore: deprecated_member_use
                      color: Colors.blue.withOpacity(0.4),
                    ),
                  ),
                  // الدائرة الثالثة
                  Container(
                    width: _animation.value * 0.4,
                    height: _animation.value * 0.4,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // ignore: deprecated_member_use
                      color: Colors.blue.withOpacity(0.6),
                    ),
                  ),
                  // شعار في المنتصف
                  Image.asset(
                     Assets.imagesSplahimagee, // مسار الشعار
                    width: 240.h,
                    height: 240.h,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
