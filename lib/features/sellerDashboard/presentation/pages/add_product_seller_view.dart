import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution/depency_injection.dart';
import 'package:gradution/features/sellerDashboard/presentation/cubit/sellerdashboard_cubit.dart';
import 'package:gradution/features/sellerDashboard/presentation/widgets/add_product_seller_view_body.dart';

class AddProductSellerView extends StatelessWidget {
  const AddProductSellerView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SellerdashboardCubit>(),
      child: AddProductSellerViewBody(),
    );
  }
}
