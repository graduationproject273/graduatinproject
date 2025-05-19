import 'package:flutter/material.dart';
import 'package:gradution/featrues/sellerDashboard/presentation/widgets/dasboard_widet.dart';

class SellerDashboardView extends StatelessWidget {
  const SellerDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body:DasboardWidet(),
    );
  }
}