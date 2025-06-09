import 'package:flutter/material.dart';
import 'package:gradution/core/styles/textstyles.dart';
import 'package:gradution/features/sellerDashboard/presentation/widgets/seller_dashboard_drawer.dart';
import 'add_product_form.dart';

class AddProductSellerViewBody extends StatelessWidget {
  const AddProductSellerViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          'Add Product',
          style: Textstyles.namereview,
        ),
        centerTitle: true,
      ),
      drawer: const SellerDashboardDrawer(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const AddProductForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
