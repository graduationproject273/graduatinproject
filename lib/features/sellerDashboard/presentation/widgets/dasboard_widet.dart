import 'package:flutter/material.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/styles/textstyles.dart';
import 'package:gradution/features/sellerDashboard/presentation/widgets/fl_chart_in_seller.dart';
import 'package:gradution/features/sellerDashboard/presentation/widgets/seller_dashboard_drawer.dart';

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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // GridView with containers at the top - now with fixed height
                SizedBox(
                  height: 300, // Fixed height for the grid
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(), // Prevent scrolling within the grid
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                    ),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      // Define different titles and values based on index
                      String title;
                      String value;
                      
                      switch (index) {
                        case 0:
                          title = 'Emails';
                          value = '10';
                          break;
                        case 1:
                          title = 'Orders';
                          value = '24';
                          break;
                        case 2:
                          title = 'Products';
                          value = '47';
                          break;
                        case 3:
                          title = 'Revenue';
                          value = '\$2,856';
                          break;
                        default:
                          title = 'Item';
                          value = '0';
                      }
                      
                      return Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: maincolor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              title,
                              style: Textstyles.textitemcart.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              value,
                              style: Textstyles.textitemcart.copyWith(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                
                const SizedBox(height: 20),
                FlchartInSeller(),
                
                // FlchartInSeller widget at the bottom - with fixed height
          
              ],
            ),
          ),
        ),
      ),
    );
  }
}