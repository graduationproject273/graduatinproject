// ignore: camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/core/routeing/routes.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/styles/textstyles.dart';
import 'package:gradution/core/widgets/custom_button.dart';

// ignore: camel_case_types
class containerTotalPrice extends StatelessWidget {
  const containerTotalPrice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity, // ضبط عرض الحاوية لملء الحاوية الأم
        height: 0.14.sh, // ضبط ارتفاع الحاوية ليكون 14% من ارتفاع الشاشة
        color: colortotalincart, // ضبط لون خلفية الحاوية
        child: Padding(
            padding: const EdgeInsets.all(16.0), // إضافة حشوة داخل الحاوية
            child: Column(
                mainAxisAlignment: MainAxisAlignment
                    .spaceEvenly, // توزيع المساحة بالتساوي بين الأطفال
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment
                        .center, // محاذاة الأطفال إلى المركز عموديًا
                    children: [
                      Text('Total',
                          style: Textstyles
                              .textitemtotal), // عرض النص 'Total' بنمط معين
                      Text(' \$64.95',
                          style: Textstyles
                              .textitemcart), // عرض السعر الإجمالي بنمط معين
                      Spacer(), // إضافة مسافة لدفع الزر إلى اليمين
                      SizedBox(
                          width: 150.w, // ضبط عرض الزر
                          child: CustomButton(
                            text: 'Checkout', // نص الزر
                            onTap: () {
                              Navigator.pushNamed(context, Routes.checkout);
                            }, // رد نقر الزر
                            buttonbodycolor: maincolor, // لون خلفية الزر
                            textcolor: Colors.white, // لون نص الزر
                          ))
                    ],
                  ),
                ])));
  }
}
