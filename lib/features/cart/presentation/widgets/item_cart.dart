// ignore: camel_case_types
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/constants/images.dart';

import 'package:gradution/core/styles/extention.dart';
import 'package:gradution/core/styles/textstyles.dart';
import 'package:gradution/features/cart/presentation/widgets/row_increment_and_decrement_number.dart';

// ignore: camel_case_types
class ItemCart extends StatelessWidget {
  const ItemCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white, // لون الخلفية
      borderRadius: BorderRadius.circular(20), // حواف دائرية
      elevation: 5, // ارتفاع الظل
      child: Container(
          width: double.infinity, // عرض الحاوية
          height:  context.height * .16, // ارتفاع الحاوية
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), // حواف دائرية
              color: Colors.white), // لون الخلفية
          child: Padding(
              padding: const EdgeInsets.all(16.0), // الحشوة الداخلية
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // توزيع العناصر بالتساوي
                  children: [
                    Image.asset(
                      Assets.imagesCameres, // صورة المنتج
                      width: context.width * .2, // عرض الصورة
                      height: context.height * .15, // ارتفاع الصورة
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround, // توزيع العناصر بالتساوي
                        crossAxisAlignment: CrossAxisAlignment.start, // محاذاة العناصر إلى اليسار
                        children: [
                          Text('Nike Club Max', style: Textstyles.textitemcart), // اسم المنتج
                          Text('\$64.95', style: Textstyles.textitemcart), // سعر المنتج
                          rowIncrementAndDecrementNumber(), // عنصر لزيادة أو تقليل العدد
                        ]),
                    IconButton(
                        onPressed: () {}, // حدث عند الضغط على الزر
                        icon: Icon(
                            size: 25.sp,
                            CupertinoIcons.delete, // أيقونة الحذف
                            color: Colors.red)) // لون الأيقونة
                  ]))),
    );
  }
}
