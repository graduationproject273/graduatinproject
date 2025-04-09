import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:gradution/core/routeing/routes.dart';
import 'package:gradution/featrues/adminDashboard/presentation/views/admin_dashboard_view.dart';
import 'package:gradution/featrues/authintication/presentation/views/login_view.dart';
import 'package:gradution/featrues/authintication/presentation/views/register_view.dart';
import 'package:gradution/featrues/blog/presentation/view/blog_details_view.dart';
import 'package:gradution/featrues/blog/presentation/view/blog_view.dart';
import 'package:gradution/featrues/cart/presentation/views/cart_view.dart';
import 'package:gradution/featrues/categories/presentation/views/categories_view.dart';
import 'package:gradution/featrues/checkout/presentation/views/checkout_view.dart';
import 'package:gradution/featrues/home/presentation/views/home_view.dart';
import 'package:gradution/featrues/onbording/presentation/views/auth_buttons_view.dart';
import 'package:gradution/featrues/onbording/presentation/views/onboarding_view.dart';
import 'package:gradution/featrues/onbording/presentation/views/splash_view.dart';
import 'package:gradution/featrues/order-success/presentation/views/order_success_view.dart';
import 'package:gradution/featrues/products/presentation/view/product_details_view.dart';
import 'package:gradution/featrues/products/presentation/view/product_view.dart';
import 'package:gradution/featrues/profile/presentation/views/profile_view.dart';
import 'package:gradution/featrues/refall/presentation/views/refall_view.dart';
import 'package:gradution/featrues/reviews/presentation/view/reviews_view.dart';
import 'package:gradution/featrues/reviews/presentation/view/add_reviews_view.dart';

final GlobalKey<SliderDrawerState> sliderKey = GlobalKey<SliderDrawerState>();

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: Routes.splash,
      builder: (context, state) => SplashView(),
    ),
    GoRoute(
      path: Routes.onBoarding,
      builder: (context, state) => OnboardingView(),
    ),
    GoRoute(
      path: Routes.home,
      builder: (context, state) => HomeView(sliderKey: sliderKey),
    ),
    GoRoute(
      path: Routes.register,
      builder: (context, state) => const RegisterView(),
    ),
    GoRoute(
      path: Routes.login,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: Routes.products,
      builder: (context, state) => const ProductView(),
    ),
    GoRoute(
      path: Routes.productDetails,
      builder: (context, state) => const ProductDetailesView(),
    ),
    GoRoute(
      path: Routes.categories,
      builder: (context, state) => const CategoriesView(),
    ),
    GoRoute(
      path: Routes.blog,
      builder: (context, state) => const BlogView(),
    ),
    GoRoute(
      path: Routes.blogDetails,
      builder: (context, state) => const BlogDetailsView(),
    ),
    GoRoute(
      path: Routes.cart,
      builder: (context, state) => const CartView(),
    ),
    GoRoute(
      path: Routes.checkout,
      builder: (context, state) => const CheckoutView(),
    ),
    GoRoute(
      path: Routes.orderSuccess,
      builder: (context, state) => const OrderSuccessView(),
    ),
    GoRoute(
      path: Routes.profile,
      builder: (context, state) => const ProfileView(),
    ),
    GoRoute(
      path: Routes.refall,
      builder: (context, state) => const RefillView(),
    ),
    GoRoute(
      path: Routes.adminDashboard,
      builder: (context, state) => const AdminDashboardView(),
    ),
    GoRoute(
      path: Routes.reviews,
      builder: (context, state) => const ReviewsView(),
    ),
    GoRoute(
      path: Routes.addReview,
      builder: (context, state) => const ReviewsViewBody(),
    ),
    GoRoute(
      path: Routes.authbuttonsview,
      builder: (context, state) => const AuthButtonsView(),
    ),
    // أضف هنا أي Routes إضافية
  ],
  errorBuilder: (context, state) => const Scaffold(
    body: Center(child: Text('Page not found')),
  ),
);
