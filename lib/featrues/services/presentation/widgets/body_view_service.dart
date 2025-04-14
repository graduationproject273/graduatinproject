import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/styles/extention.dart';
import 'package:gradution/core/widgets/custom_button.dart';
import 'package:gradution/featrues/services/presentation/widgets/body_about_your_home.dart';
import 'package:gradution/featrues/services/presentation/widgets/body_formuser_widet.dart';
import 'package:gradution/featrues/services/presentation/widgets/body_smart_application.dart';
import 'package:gradution/featrues/services/presentation/widgets/services_for_sale_widget.dart';

class BodyViewService extends StatefulWidget {
  const BodyViewService({super.key});

  @override
  State<BodyViewService> createState() => _BodyViewServiceState();
}

class _BodyViewServiceState extends State<BodyViewService> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Widget> pages = [
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

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    width: context.width*.9,
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
                    
                        // زر التالي
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
                          const SizedBox(width: 100)  // زر السابق
                        
                      ],
                    ),
                  ),
                )
         
         ],
        ),
      ),
    );
  }
}
