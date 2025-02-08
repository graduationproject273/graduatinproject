import 'package:flutter/material.dart';
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
import 'package:gradution/featrues/contactus/presentation/view/contactus_view.dart';
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

class AppRouting {
  // إنشاء GlobalKey<SliderDrawerState> هنا
  final GlobalKey<SliderDrawerState> sliderKey = GlobalKey<SliderDrawerState>();

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (_) => SplashView(),
        );
      case Routes.onBoarding:
        return MaterialPageRoute(
          builder: (_) => OnboardingView(),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => HomeView(sliderKey: sliderKey), // تمرير sliderKey هنا
        );
      case Routes.register:
        return MaterialPageRoute(
          builder: (_) => const RegisterView(),
        );
         case Routes.contactus:
        return MaterialPageRoute(
          builder: (_) => const ContactusView(), // تمرير sliderKey هنا
        );
      case Routes.login:
      
        return MaterialPageRoute(
          builder: (_) => const LoginView(),
        );
      case Routes.products:
        return MaterialPageRoute(
          builder: (_) => const ProductView(),
        );
      case Routes.productDetails:
        return MaterialPageRoute(
          builder: (_) => const ProductDetailesView(),
        );
      case Routes.categories:
        return MaterialPageRoute(
          builder: (_) => const CategoriesView(),
        );
      case Routes.blog:
        return MaterialPageRoute(
          builder: (_) => const BlogView(),
        );
      case Routes.blogDetails:
        return MaterialPageRoute(
          builder: (_) => const BlogDetailsView(),
        );
      case Routes.cart:
        return MaterialPageRoute(
          builder: (_) => const CartView(),
        );
      case Routes.checkout:
        return MaterialPageRoute(
          builder: (_) => const CheckoutView(),
        );
      case Routes.orderSuccess:
        return MaterialPageRoute(
          builder: (_) => const OrderSuccessView(),
        );
      case Routes.profile:
        return MaterialPageRoute(
          builder: (_) => const ProfileView(),
        );
      case Routes.refall:
        return MaterialPageRoute(
          builder: (_) => const RefillView(),
        );
      case Routes.adminDashboard:
        return MaterialPageRoute(
          builder: (_) => const AdminDashboardView(),
        );
      case Routes.reviews:
        return MaterialPageRoute(
          builder: (_) => const ReviewsView(),
        );
      case Routes.addReview:
        return MaterialPageRoute(
          builder: (_) => const ReviewsViewBody(),
        );
      case Routes.authbuttonsview:
        return MaterialPageRoute(
          builder: (_) => const AuthButtonsView(),
        );
      default:
        return null;
    }
  }
}