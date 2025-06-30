import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution/depency_injection.dart';
import 'package:gradution/features/sellerDashboard/presentation/cubit/cubit/seller_summary_cubit.dart';
import 'package:gradution/features/sellerDashboard/presentation/widgets/dasboard_widet.dart';

class SellerDashboardView extends StatelessWidget {
  const SellerDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value:sl<SellerSummaryCubit>()..getsellerSummary() ,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: DasboardWidet(),
      ),
    );
  }
}
