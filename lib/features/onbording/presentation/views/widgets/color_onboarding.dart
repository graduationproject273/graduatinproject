import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution/core/routeing/routes.dart';
import 'package:gradution/core/styles/extention.dart';
import 'package:gradution/features/onbording/presentation/views/widgets/texts_in_onboarding.dart';

import '../../../../../core/styles/textstyles.dart';

// ignore: camel_case_types
class coloronboarding extends StatelessWidget {
  final String image;
  final String text1;
  final String text2;
  final bool isVisible;
  const coloronboarding({
    super.key, required this.image, required this.text1, required this.text2, required this.isVisible,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        
        gradient: LinearGradient(
          colors: [
            Colors.transparent, // لون أغمق
            Colors.black, // شفاف
          ],
          begin: Alignment.topCenter, // يبدأ من الأعلى
          end: Alignment.bottomCenter, // ينتهي في الأسفل
        ),
      ),
      child:  Padding(
        padding:  EdgeInsets.symmetric(horizontal: 8.0.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Visibility(
                                  visible: isVisible,
                                  child: GestureDetector(
                                    onTap: () {
                                    GoRouter.of(context).push(Routes.login);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 16, top: 16),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text('Skip',
                          style: Textstyles.text2Inonboarding
                              .copyWith(fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                      ),
        Spacer(),
                    TextsInOnboarding(
                      text1: text1,
                      text2: text2,
                    ),
                    SizedBox(
                height: context.height*.15,
                    )
              
                    ]),
      )
    );
  }
}
