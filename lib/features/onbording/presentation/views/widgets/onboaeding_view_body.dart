import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution/constants/images.dart';
import 'package:gradution/core/routeing/routes.dart';
import 'package:gradution/features/onbording/presentation/views/widgets/body_onboarding.dart';
import 'package:gradution/features/onbording/presentation/views/widgets/button_and_indicators.dart';


class OnboaedingViewBody extends StatefulWidget {
  const OnboaedingViewBody({super.key});

  @override
  State<OnboaedingViewBody> createState() => _OnboaedingViewBodyState();
}

class _OnboaedingViewBodyState extends State<OnboaedingViewBody> with SingleTickerProviderStateMixin {
  
  late PageController _pageController;
   late AnimationController _animationController;
  int currentPage = 0;
  @override
  void initState() {
    _pageController = PageController();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300), // مدة الحركة
    );
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  @override
Widget build(BuildContext context) {
  return Stack(
    children: [
      Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                    _animationController.forward(from: 0.0); // تحريك المؤشر عند التغيير
                  });
                },
              children: [
                BodyOnboarding(
                  text1: 'Convenience',
                  text2:
                      'Control your home devices using a single app from anywhere in the world',
                  isVisible: true,
                  image: Assets.imagesOnboardingimagefirst,
                ),
                BodyOnboarding(
                  text1: 'Stay informed',
                  text2:
                      'Instant notification of you about any activity or alerts.',
                  isVisible: true,
                  image: Assets.imagesOnboardingimagesecond,
                ),
                BodyOnboarding(
                  text1: 'Automate',
                  text2:
                      'Switch through different scenes and quick action for fast management of your home.',
                  isVisible: false,
                  image: Assets.imagesOnboardingimagethird,
                ),
              ],
            ),
          ),
        ],
      ),
      Positioned(
        bottom: 16,
        left: 16,
        right: 16,
        child: ButtonAndIndicators(position: currentPage, onNextPressed: () { 
          if (currentPage == 2) {
            GoRouter.of(context).push(Routes.dashboardseller);
          }
          _pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
          );
         }, animationController: _animationController,),
      ),
    ],
  );
}

  }
