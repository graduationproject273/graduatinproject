import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/styles/extention.dart';
import 'package:gradution/core/widgets/custom_button.dart';
import 'package:gradution/features/services/domain/entities/address_entity.dart';
import 'package:gradution/features/services/domain/entities/offer_entity.dart';
import 'package:gradution/features/services/domain/entities/optional_offer_entity.dart';
import 'package:gradution/features/services/presentation/cubit/services_cubit.dart';
import 'package:gradution/features/services/presentation/widgets/body_about_your_home.dart';
import 'package:gradution/features/services/presentation/widgets/body_formuser_widet.dart';
import 'package:gradution/features/services/presentation/widgets/body_smart_application.dart';
import 'package:gradution/features/services/presentation/widgets/services_for_sale_widget.dart';

class BodyViewService extends StatefulWidget {
  const BodyViewService({super.key});

  @override
  State<BodyViewService> createState() => _BodyViewServiceState();
}

class _BodyViewServiceState extends State<BodyViewService> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Widget> pages = const [
    BodyFormuserWidet(),
    BodyAboutYourHome(),
    BodySmartApplication(),
    ServicesForSaleWidget(),
  ];

  void _goToPage(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  bool _validateForm(ServicesCubit cubit) {
    // Basic validation
    if (cubit.firstNameController.text.isEmpty ||
        cubit.lastNameController.text.isEmpty ||
        cubit.emailController.text.isEmpty ||
        cubit.selectedHomeType.isEmpty ||
        cubit.selectedHomeStatus.isEmpty ||
        cubit.selectedHomeSize.isEmpty) {
      return false;
    }
    return true;
  }

  int _parseHomeSize(String homeSize) {
    // Parse home size string to integer
    switch (homeSize) {
      case 'less than 100 m2':
        return 100;
      case 'between 100 and 200 m2':
        return 150;
      case 'between 200 and 300 m2':
        return 250;
      case 'between 300 and 400 m2':
        return 350;
      default:
        return 0;
    }
  }

  void _submitForm(BuildContext context) {
    final cubit = context.read<ServicesCubit>();

    // Validate form
    if (!_validateForm(cubit)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all required fields'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      final offer = OfferEntity(
        firstName: cubit.firstNameController.text,
        lastName: cubit.lastNameController.text,
        mobile: cubit.mobileController.text,
        email: cubit.emailController.text,
        address: AddressOfferEntity(
          city: cubit.cityController.text,
          state: cubit.stateController.text,
          street: cubit.streetController.text,
          zipcode: cubit.zipController.text,
        ),
        requirements: cubit.requirementsController.text,
        homeType: cubit.selectedHomeType,
        homeStatus: cubit.selectedHomeStatus,
        homeSize: _parseHomeSize(cubit.selectedHomeSize),
        numberOfLevels: int.tryParse(cubit.numberOfLevelsController.text) ?? 1,
        numberOfRooms: int.tryParse(cubit.numberOfRoomsController.text) ?? 1,
        installationDate: cubit.selectedInstallationDate ?? DateTime.now(),
        smartSensors: cubit.smartSensors,
        optionalFeatures: OptionalFeaturesModel.fromJson(cubit.optionalFeatures),
      );

      print('Submitting offer: ${offer.toString()}'); // Debug print
      cubit.addOffer(offer);
    } catch (e) {
      print('Error creating offer: $e'); // Debug print
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error creating offer: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ServicesCubit, ServicesState>(
      listener: (context, state) {
        if (state is ServicesLoading) {
          // Show loading indicator
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is ServicesLoaded) {
          // Hide loading and show success
          Navigator.of(context).pop(); // Close loading dialog
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Offer submitted successfully!'),
              backgroundColor: Colors.green,
            ),
          );
          
          // Reset form or navigate to another page
          // Navigator.of(context).pop(); // Uncomment if you want to go back
        } else if (state is ServicesError) {
          // Hide loading and show error
          Navigator.of(context).pop(); // Close loading dialog
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Failed to submit offer. Please try again.'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: maincolor, width: 1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  children: pages,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 50,
                  width: context.width * .9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (_currentPage > 0)
                        SizedBox(
                          width: 100.w,
                          height: 50,
                          child: CustomButton(
                            onTap: () => _goToPage(_currentPage - 1),
                            text: 'Previous',
                          ),
                        )
                      else
                        const SizedBox(width: 100),

                      if (_currentPage < pages.length - 1)
                        SizedBox(
                          width: 100.w,
                          height: 50,
                          child: CustomButton(
                            onTap: () => _goToPage(_currentPage + 1),
                            text: 'Next',
                          ),
                        )
                      else
                        SizedBox(
                          width: 100.w,
                          height: 50,
                          child: BlocBuilder<ServicesCubit, ServicesState>(
                            builder: (context, state) {
                              return CustomButton(
                                onTap: state is ServicesLoading 
                                    ? null 
                                    : () => _submitForm(context),
                                text: state is ServicesLoading 
                                    ? 'Submitting...' 
                                    : 'Submit',
                              );
                            },
                          ),
                        ),
                    ],
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