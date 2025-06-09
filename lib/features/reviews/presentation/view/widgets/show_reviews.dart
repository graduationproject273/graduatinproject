import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution/core/routeing/routes.dart';
import 'package:gradution/core/widgets/custom_button.dart';
import 'package:gradution/features/reviews/presentation/view/widgets/container_review.dart';

class ShowReviews extends StatelessWidget {
  const ShowReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '245 Reviews',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Icon(Icons.star, color: Colors.yellow, size: 24.sp),
                ],
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 150.w, // تحديد عرض أقصى للزر
              ),
              child: CustomButton(
                text: 'Add Review',
                onTap: () {
                 GoRouter.of(context).push(Routes.addReview);
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        const Containerreview(),
        ListView.builder(
          shrinkWrap: true, // يجعل ListView.builder تتكيف مع محتواها
          physics: const NeverScrollableScrollPhysics(), // يمنع التمرير الداخلي
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: const Containerreview(),
            );
          },
          itemCount: 2,
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}