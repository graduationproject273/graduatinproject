import 'package:flutter/material.dart';
import 'package:gradution/featrues/sellerDashboard/presentation/widgets/seller_dashboard_drawer.dart';
import 'package:gradution/featrues/sellerDashboard/presentation/widgets/fl_chart_in_seller.dart';
import 'package:gradution/featrues/sellerDashboard/presentation/widgets/sller_dashboard_view_body.dart';

class SellerDashboardView extends StatelessWidget {
  const SellerDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       drawer: SellerDashboardDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Seller Dashboard'),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body:SellerDashboardViewBody ()
    );
  }
}