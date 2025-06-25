import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution/depency_injection.dart';
import 'package:gradution/features/sellerDashboard/presentation/cubit/cubit/get_product_seller_cubit.dart';
import 'package:gradution/features/sellerDashboard/presentation/widgets/products_seller_view_body.dart';

class ProductsSellerView extends StatelessWidget {
  const ProductsSellerView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GetProductSellerCubit>()..getAllProductfun(),
      child: ProductsSellerViewBody(),
    );
  }
}
