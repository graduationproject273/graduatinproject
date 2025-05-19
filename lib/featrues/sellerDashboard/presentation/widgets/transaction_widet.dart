import 'package:flutter/material.dart';
import 'package:gradution/core/styles/textstyles.dart';
import 'package:gradution/featrues/sellerDashboard/presentation/widgets/seller_dashboard_drawer.dart';

class TransactionWidet extends StatelessWidget {
  const TransactionWidet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          'Transactions',
          style: Textstyles.namereview,
        ),
        centerTitle: true,
      ),
      drawer: const SellerDashboardDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            
          )
        ),
      ),
    );
  }
}