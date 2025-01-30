import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/core/widgets/custom_button.dart';

class ButtonsInDetailsPage extends StatelessWidget {
  const ButtonsInDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 60.w,
          height: 50.h,
          decoration: BoxDecoration(
            color: const Color(0xffF0F0F0),
            borderRadius: BorderRadius.circular(8),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border),
          ),
        ),
        SizedBox(
          width: 220.w, 
          child: CustomButton(
            text: 'Add to cart',
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
