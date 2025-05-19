import 'package:flutter/material.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/styles/textstyles.dart';
import 'package:gradution/featrues/sellerDashboard/presentation/widgets/seller_dashboard_drawer.dart';

class DasboardWidet extends StatelessWidget {
  const DasboardWidet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          'Dashboard',
          style: Textstyles.namereview,
        ),
        centerTitle: true,
      ),
      drawer: const SellerDashboardDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.2, // Adjust aspect ratio for better fit
                    crossAxisSpacing: 15, // Add horizontal spacing between items
                    mainAxisSpacing: 15,   // Add vertical spacing between items
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) => Container(
                    padding: const EdgeInsets.all(15), // Add padding inside container
                    decoration: BoxDecoration(
                      color: maincolor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
                      mainAxisSize: MainAxisSize.min, // Take minimum space needed
                      children: [
                        Text(
                          'Emails',
                          style: Textstyles.textitemcart.copyWith(
                            color: Colors.white
                          ),
                        ),
                        const SizedBox(height: 15), // Increased spacing between text elements
                        Text(
                          '10',
                          style: Textstyles.textitemcart.copyWith(
                            color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}