import 'package:flutter/material.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/styles/textstyles.dart';
import 'package:gradution/core/widgets/custom_button.dart';
import 'package:im_stepper/stepper.dart';

class SellerStepsPage extends StatefulWidget {
  const SellerStepsPage({super.key});

  @override
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
        child: Column(
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
            SizedBox(
              width: screenWidth,
              child: Padding(
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
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Center(
                child: _buildStepContent(activeStep),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 120,
                    child:ElevatedButton(
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
          ],
        ),
      ),
    );
  }

  Widget _buildStepContent(int step) {
    switch (step) {
      case 0:
        return const Text("Step 1: Tax Details & Mobile");
      case 1:
        return const Text("Step 2: Pickup Address");
      case 2:
        return const Text("Step 3: Bank Details");
      case 3:
        return const Text("Step 4: Supplier Details");
      default:
        return const Text("Invalid Step");
    }
  }
}
