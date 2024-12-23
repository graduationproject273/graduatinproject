import 'package:flutter/material.dart';
import 'package:gradution/core/routeing/routes.dart';
import 'package:gradution/featrues/home/presentation/views/home_view.dart';
import 'package:gradution/featrues/onbording/presentation/views/onboarding_view.dart';

class AppRouting {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(
          builder: (_) => const OnboardingView(),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
        );
      
      default:
    }
    return null;
  }
}