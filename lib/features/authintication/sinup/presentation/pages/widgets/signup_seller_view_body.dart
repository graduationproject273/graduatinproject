import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/styles/textstyles.dart';
import 'package:gradution/core/widgets/custom_button.dart';
import 'package:gradution/features/authintication/sinup/presentation/cubit/seller_cubit/cubit/seller_cubit.dart';
import 'package:gradution/features/authintication/sinup/presentation/pages/widgets/already_have_account_widgget.dart';
import 'package:gradution/features/authintication/sinup/presentation/pages/widgets/details_in_seller_signup_widget.dart';
import 'package:gradution/features/authintication/sinup/presentation/pages/widgets/pickup_address_widget.dart';
import 'package:gradution/features/authintication/sinup/presentation/pages/widgets/supplier_details_in_seller_signup.dart';
import 'package:gradution/features/authintication/sinup/presentation/pages/widgets/tax_details_in_seller_signup_details.dart';
import 'package:gradution/features/products/data/model/sub_model/address_model.dart';
import 'package:gradution/features/products/domain/entities/sub_entities/address_entity.dart';
import 'package:gradution/features/products/domain/entities/sub_entities/seller_entity.dart';
import 'package:im_stepper/stepper.dart';

class SellerStepsPage extends StatefulWidget {
  final String? userToken; // ✅ إضافة التوكن كمعامل
  
  const SellerStepsPage({super.key, this.userToken});

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
    final cubit = context.read<SellerCubit>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Become a Seller", style: Textstyles.namereview),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: BlocListener<SellerCubit, SellerState>(
          listener: (context, state) {
            if (state is SellerSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Seller registered successfully!"),
                  backgroundColor: Colors.green,
                ),
              );
              // ✅ يمكنك إضافة navigation هنا
              // Navigator.pushReplacementNamed(context, '/seller-dashboard');
            } else if (state is SellerError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
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

              // ⬇️ Form with dynamic content
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Form(
                  key: cubit.formkey,
                  child: _buildStepContent(activeStep),
                ),
              ),

              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 25),
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
                      child: BlocBuilder<SellerCubit, SellerState>(
                        builder: (context, state) {
                          return CustomButton(
                            onTap: state is SellerLoading ? null : () async {
                              if (activeStep < steps.length - 1) {
                                // ✅ التحقق من صحة الخطوة الحالية
                                if (_validateCurrentStep(cubit, activeStep)) {
                                  setState(() {
                                    activeStep++;
                                  });
                                }
                              } else {
                                // ✅ الخطوة الأخيرة - إرسال البيانات
                                if (cubit.formkey.currentState!.validate()) {
                                  final seller = SellerEntity(
                                    businessName: cubit.bussinessNameController.text,
                                    name: cubit.nameController.text,
                                    mail: cubit.emailController.text,
                                    mobile: cubit.mobileController.text,
                                    bankAccountNumber: cubit.bankAccountNumberController.text,
                                    bankAccountHolderName: cubit.bankAccountHolderNameController.text,
                                    TIN: cubit.TINController.text,
                                    swiftCode: cubit.swiftCodeController.text,
                                    logo: cubit.logoController.text.isEmpty 
                                        ? "https://example.com/logo.png" 
                                        : cubit.logoController.text,
                                    banner: cubit.bannerController.text.isEmpty 
                                        ? "https://example.com/banner.png" 
                                        : cubit.bannerController.text,
                                    addresses: [
                                      AddressEntity(
                                        street: cubit.streetController.text,
                                        state: cubit.stateController.text,
                                        city: cubit.cityController.text,
                                        zip: cubit.zipCodeController.text,
                                        country: "USA", // ✅ Fixed country
                                      )
                                    ],
                                  );

                                  await cubit.signupSeller(seller);
                                }
                              }
                            },
                            text: state is SellerLoading 
                                ? 'Loading...' 
                                : (activeStep < steps.length - 1 ? 'Next' : 'Submit'),
                            buttonbodycolor: maincolor,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              AlreadyHaveAccountWidgget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStepContent(int step) {
    final cubit = context.read<SellerCubit>();
    switch (step) {
      case 0:
        return TaxDetailsInSellerSignupDetails(cubit: cubit);
      case 1:
        return PickupAddressWidget(); // ✅ تمرير الكوبيت
      case 2:
        return DetailsInSellerSignupWidget(); // ✅ تمرير الكوبيت
      case 3:
        return SupplierDetailsInSellerSignup(); // ✅ تمرير الكوبيت
      default:
        return const Text("Invalid Step");
    }
  }
  
  // ✅ دالة للتحقق من صحة كل خطوة
  bool _validateCurrentStep(SellerCubit cubit, int step) {
    switch (step) {
      case 0: // Tax Details & Mobile
        if (cubit.TINController.text.isEmpty || cubit.mobileController.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Please fill all required fields")),
          );
          return false;
        }
        return true;
      case 1: // Pickup Address
        if (cubit.streetController.text.isEmpty || 
            cubit.cityController.text.isEmpty || 
            cubit.stateController.text.isEmpty ||
            cubit.zipCodeController.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Please fill all address fields")),
          );
          return false;
        }
        return true;
      case 2: // Bank Details
        if (cubit.bankAccountNumberController.text.isEmpty || 
            cubit.bankAccountHolderNameController.text.isEmpty ||
            cubit.swiftCodeController.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Please fill all bank details")),
          );
          return false;
        }
        return true;
      case 3: // Supplier Details
        if (cubit.bussinessNameController.text.isEmpty || 
            cubit.nameController.text.isEmpty ||
            cubit.emailController.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Please fill all supplier details")),
          );
          return false;
        }
        return true;
      default:
        return true;
    }
  }
}