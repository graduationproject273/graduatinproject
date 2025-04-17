import 'package:flutter/material.dart';
import 'package:gradution/featrues/sellerDashboard/presentation/widgets/seller_dashboard_view_body.dart';

class SellerDashboardView extends StatelessWidget {
  const SellerDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // drawer: const Drawer(),
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