import 'package:flutter/material.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/styles/textstyles.dart';
import 'package:gradution/core/widgets/custom_button.dart';
import 'package:gradution/features/authintication/sinup/presentation/pages/widgets/already_have_account_widgget.dart';
import 'package:gradution/features/authintication/sinup/presentation/pages/widgets/details_in_seller_signup_widget.dart';
import 'package:gradution/features/authintication/sinup/presentation/pages/widgets/pickup_address_widget.dart';
import 'package:gradution/features/authintication/sinup/presentation/pages/widgets/supplier_details_in_seller_signup.dart';
import 'package:gradution/features/authintication/sinup/presentation/pages/widgets/tax_details_in_seller_signup_details.dart';
import 'package:im_stepper/stepper.dart';

class SellerStepsPage extends StatefulWidget {
  const SellerStepsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SellerStepsPageState createState() => _SellerStepsPageState();
}

class _SellerStepsPageState extends State<SellerStepsPage> {
  int activeStep = 0;

  final List<String> steps = [
    "Tax Details & Mobile",
    "Pickup Address",
    "Bank Details",
    "Supplier Details",
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Become a Seller",
          style: Textstyles.namereview,
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(bottom: 20),
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: NumberStepper(
                numbers: List.generate(steps.length, (index) => index + 1),
                activeStep: activeStep,
                stepRadius: 20,
                activeStepColor: maincolor,
                stepColor: Colors.grey.shade300,
                numberStyle: const TextStyle(color: Colors.black),
                activeStepBorderColor: maincolor,
                enableStepTapping: true,
                lineColor: Colors.grey.shade400,
                lineLength: 60,
                onStepReached: (index) {
                  setState(() {
                    activeStep = index;
                  });
                },
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: steps.map((title) {
                  double itemWidth = (screenWidth - 32) / steps.length;
                  return SizedBox(
                    width: itemWidth,
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 12),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 30),

            // محتوى كل خطوة
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: _buildStepContent(activeStep),
            ),

            const SizedBox(height: 30),

            // أزرار التالي والسابق
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0,top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 120,
                    child: ElevatedButton(
                      onPressed: activeStep > 0
                          ? () {
                              setState(() {
                                activeStep--;
                              });
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: maincolor,
                        side: BorderSide(color: maincolor),
                        elevation: 0,
                      ),
                      child: const Text("Previous"),
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    child: CustomButton(
                      onTap: activeStep < steps.length - 1
                          ? () {
                              setState(() {
                                activeStep++;
                              });
                            }
                          : null,
                      text: 'Next',
                      buttonbodycolor: maincolor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            AlreadyHaveAccountWidgget()
          ],
        ),
      ),
    );
  }

  Widget _buildStepContent(int step) {
    switch (step) {
      case 0:
        return const TaxDetailsInSellerSignupDetails();
      case 1:
        return const PickupAddressWidget();
      case 2:
        return const DetailsInSellerSignupWidget();
      case 3:
        return const SupplierDetailsInSellerSignup();
      default:
        return const Text("Invalid Step");
    }
  }
}
