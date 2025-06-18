import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:gradution/core/routeing/routes.dart';
import 'package:gradution/depency_injection.dart';
import 'package:gradution/features/authintication/login/presentation/pages/login_view.dart';
import 'package:gradution/features/authintication/login/presentation/widgets/otp_widget.dart';
import 'package:gradution/features/authintication/sinup/presentation/cubit/seller_cubit/cubit/seller_cubit.dart';
import 'package:gradution/features/authintication/sinup/presentation/pages/seller_sinup.dart';
import 'package:gradution/features/authintication/sinup/presentation/pages/sinup_view.dart';
import 'package:gradution/features/authintication/typeUser/presentation/views/usertype_view.dart';
import 'package:gradution/features/blog/presentation/view/blog_details_view.dart';
import 'package:gradution/features/blog/presentation/view/blog_view.dart';
import 'package:gradution/features/cart/presentation/cubits/cubit/cart_cubit.dart';
import 'package:gradution/features/cart/presentation/views/cart_view.dart';
import 'package:gradution/features/categories/presentation/views/categories_view.dart';
import 'package:gradution/features/checkout/presentation/views/checkout_view.dart';
import 'package:gradution/features/home/presentation/views/home_view.dart';
import 'package:gradution/features/onbording/presentation/views/auth_buttons_view.dart';
import 'package:gradution/features/onbording/presentation/views/onboarding_view.dart';
import 'package:gradution/features/onbording/presentation/views/splash_view.dart';
import 'package:gradution/features/order-success/presentation/views/order_success_view.dart';
import 'package:gradution/features/products/domain/entities/product_entity.dart';
import 'package:gradution/features/products/presentation/view/product_details_view.dart';
import 'package:gradution/features/products/presentation/view/product_view.dart';
import 'package:gradution/features/profile/presentation/views/profile_view.dart';
import 'package:gradution/features/reviews/presentation/view/reviews_view.dart';
import 'package:gradution/features/reviews/presentation/view/add_reviews_view.dart';
import 'package:gradution/features/sellerDashboard/presentation/pages/add_product_seller_view.dart';
import 'package:gradution/features/sellerDashboard/presentation/pages/edit_product_seller.dart';
import 'package:gradution/features/sellerDashboard/presentation/pages/order_view.dart';
import 'package:gradution/features/sellerDashboard/presentation/pages/products_seller_view.dart';
import 'package:gradution/features/sellerDashboard/presentation/pages/seller_dashboard_view.dart';
import 'package:gradution/features/sellerDashboard/presentation/widgets/dasboard_widet.dart';
import 'package:gradution/features/sellerDashboard/presentation/widgets/payments_widets.dart';
import 'package:gradution/features/sellerDashboard/presentation/widgets/transaction_widet.dart';
import 'package:gradution/features/services/presentation/pages/services_view.dart';
import 'package:gradution/features/services/presentation/widgets/appointment_widget.dart';

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
      builder: (context, state) => const SinupView(),
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
      path: Routes.sellerProductsEdit,
      builder: (context, state) => EditProductSeller (productEntity: state.extra as ProductEntity),
    ),
    GoRoute(
      path: Routes.productDetails,
      builder: (context, state) => BlocProvider(
        create: (context) => sl<CartCubit>(),
        child: ProductDetailesView(
          productEntity: state.extra as ProductEntity,
        ),
      ),
    ),
    GoRoute(
      path: Routes.dashboardseller,
      builder: (context, state) => const SellerDashboardView(),
    ),
    GoRoute(
      path: Routes.service,
      builder: (context, state) => const ServicesView(),
    ),
    GoRoute(
      path: Routes.categories,
      builder: (context, state) => const CategoriesView(),
    ),
    GoRoute(
      path: Routes.order,
      builder: (context, state) => const OrderView(),
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
      builder: (context, state) {
        return BlocProvider(
          create: (context) =>
              sl<CartCubit>()..getCartItems(), // استدعاء getCartItems
          child: CartView(),
        );
      },
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
    GoRoute(
      path: Routes.usertype,
      builder: (context, state) => const UsertypeView(),
    ),
    GoRoute(
      path: Routes.otpwidget,
      builder: (context, state) => const OtpWidget(),
    ),
    GoRoute(
      path: Routes.signupseller,
      builder: (context, state) => BlocProvider(
        create: (context) =>
            sl<SellerCubit>(), // أو SellerCubit() لو مش بتستخدم GetIt
        child: const SellerSignup(),
      ),
    ),
    GoRoute(
      path: Routes.apponimentwidget,
      builder: (context, state) => const AppointmentDialog(),
    ),
    GoRoute(
      path: Routes.sellerProducts,
      builder: (context, state) => const ProductsSellerView(),
    ),
    GoRoute(
      path: Routes.addsellerProducts,
      builder: (context, state) => const AddProductSellerView(),
    ),
    GoRoute(
      path: Routes.payments,
      builder: (context, state) => const PaymentsWidets(),
    ),
    GoRoute(
      path: Routes.transactions,
      builder: (context, state) => const TransactionWidet(),
    ),
    GoRoute(
      path: Routes.dashboardhome,
      builder: (context, state) => const DasboardWidet(),
    ),
  ],
  errorBuilder: (context, state) => const Scaffold(
    body: Center(child: Text('Page not found')),
  ),
);
