import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution/constants/images.dart';
import 'package:gradution/core/routeing/routes.dart';
import 'package:gradution/core/styles/colors.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with TickerProviderStateMixin {
  late AnimationController _circleController;
  late AnimationController _logoController;
  late AnimationController _textController;
  late AnimationController _fadeController;
  
  late Animation<double> _circleAnimation;
  late Animation<double> _logoScaleAnimation;
  late Animation<double> _logoRotationAnimation;
  late Animation<double> _textAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // إعداد AnimationController للدوائر
    _circleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // إعداد AnimationController للشعار
    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    // إعداد AnimationController للنص
    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    // إعداد AnimationController للتلاشي العام
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    // إعداد الحركات
    _circleAnimation = Tween<double>(begin: 50, end: 350).animate(
      CurvedAnimation(parent: _circleController, curve: Curves.elasticOut),
    );

    _logoScaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.bounceOut),
    );

    _logoRotationAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.easeInOut),
    );

    _textAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _textController, curve: Curves.easeOutBack),
    );

    _fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    // بدء التسلسل الحركي
    _startAnimationSequence();

    // الانتقال إلى الصفحة التالية
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        GoRouter.of(context).push(Routes.onBoarding);
      }
    });
  }

  void _startAnimationSequence() async {
    // بدء حركة الدوائر
    _circleController.forward();
    
    // انتظار قليل ثم بدء حركة الشعار
    await Future.delayed(const Duration(milliseconds: 300));
    _logoController.forward();
    
    // انتظار قليل ثم بدء حركة النص
    await Future.delayed(const Duration(milliseconds: 500));
    _textController.forward();
    
    // بدء تأثير التلاشي في النهاية
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      _fadeController.forward();
    }
  }

  @override
  void dispose() {
    _circleController.dispose();
    _logoController.dispose();
    _textController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                maincolor.withOpacity(0.1),
                Colors.white,
                maincolor.withOpacity(0.05),
              ],
            ),
          ),
          child: AnimatedBuilder(
            animation: Listenable.merge([
              _circleAnimation,
              _logoScaleAnimation,
              _logoRotationAnimation,
              _textAnimation,
              _fadeAnimation,
            ]),
            builder: (context, child) {
              return FadeTransition(
                opacity: _fadeAnimation,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // الدوائر المتحركة مع الشعار
                      SizedBox(
                        width: 400.w,
                        height: 400.w,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // الدائرة الخارجية مع تأثير النبض
                            AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              width: _circleAnimation.value,
                              height: _circleAnimation.value,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: maincolor.withOpacity(0.1),
                                boxShadow: [
                                  BoxShadow(
                                    color: maincolor.withOpacity(0.2),
                                    blurRadius: 20,
                                    spreadRadius: 5,
                                  ),
                                ],
                              ),
                            ),
                            // الدائرة المتوسطة
                            AnimatedContainer(
                              duration: Duration(milliseconds: 700),
                              width: _circleAnimation.value * 0.7,
                              height: _circleAnimation.value * 0.7,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: maincolor.withOpacity(0.2),
                                boxShadow: [
                                  BoxShadow(
                                    color: maincolor.withOpacity(0.3),
                                    blurRadius: 15,
                                    spreadRadius: 3,
                                  ),
                                ],
                              ),
                            ),
                            // الدائرة الداخلية
                            AnimatedContainer(
                              duration: Duration(milliseconds: 900),
                              width: _circleAnimation.value * 0.45,
                              height: _circleAnimation.value * 0.45,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: maincolor.withOpacity(0.3),
                                boxShadow: [
                                  BoxShadow(
                                    color: maincolor.withOpacity(0.4),
                                    blurRadius: 10,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                            ),
                            // الشعار مع حركة دوران وتكبير
                            Transform.scale(
                              scale: _logoScaleAnimation.value,
                              child: Transform.rotate(
                                angle: _logoRotationAnimation.value * 0.5,
                                child: Container(
                                  padding: EdgeInsets.all(20.w),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: maincolor.withOpacity(0.3),
                                        blurRadius: 15,
                                        spreadRadius: 5,
                                      ),
                                    ],
                                  ),
                                  child: Image.asset(
                                    Assets.imagesModifylogo,
                                    width: 180.w,
                                    height: 180.w,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      SizedBox(height: 60.h),
                      
                      // نص EZSmart مع تأثيرات جذابة
                      Transform.scale(
                        scale: _textAnimation.value,
                        child: Column(
                          children: [
                            // النص الرئيسي
                            ShaderMask(
                              shaderCallback: (bounds) => LinearGradient(
                                colors: [
                                  maincolor,
                                  maincolor.withOpacity(0.8),
                                  maincolor.withOpacity(0.6),
                                ],
                              ).createShader(bounds),
                              child: Text(
                                'EZSmart',
                                style: TextStyle(
                                  fontSize: 48.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 3.0,
                                  shadows: [
                                    Shadow(
                                      color: maincolor.withOpacity(0.5),
                                      blurRadius: 10,
                                      offset: Offset(0, 5),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            
                            SizedBox(height: 16.h),
                            
                            // النص الفرعي
                            FadeTransition(
                              opacity: _textAnimation,
                              child: Text(
                                'Smart Solutions for Everyone',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: maincolor.withOpacity(0.8),
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.5,
                                ),
                              ),
                            ),
                            
                            SizedBox(height: 40.h),
                            
                            // مؤشر التحميل المخصص
                            FadeTransition(
                              opacity: _textAnimation,
                              child: SizedBox(
                                width: 200.w,
                                child: LinearProgressIndicator(
                                  backgroundColor: maincolor.withOpacity(0.2),
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    maincolor.withOpacity(0.8),
                                  ),
                                  minHeight: 4.h,
                                ),
                              ),
                            ),
                            
                            SizedBox(height: 20.h),
                            
                            // نص "جاري التحميل"
                            FadeTransition(
                              opacity: _textAnimation,
                              child: Text(
                                ' Loading...',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: maincolor.withOpacity(0.6),
                                  fontWeight: FontWeight.w400,
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
            },
          ),
        ),
      ),
    );
  }
}