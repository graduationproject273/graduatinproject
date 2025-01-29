import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/core/styles/textstyles.dart';

class DropdownDiscount extends StatefulWidget {
  const DropdownDiscount({super.key});

  @override
  State<DropdownDiscount> createState() => _DropdownDiscountState();
}

class _DropdownDiscountState extends State<DropdownDiscount> {
  String selectedValue = '10%'; // القيمة الافتراضية

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Discount', style: Textstyles.namereview),
              Container(
                width: 100.w,
                decoration: BoxDecoration(
                  color: Color(0xff8F959E), // لون الخلفية
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButtonHideUnderline(
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      canvasColor: Color(0xff8F959E), // لون خلفية القائمة
                    ),
                    child: DropdownButton<String>(
                      isExpanded: true, // توسيع العنصر لجعل القيمة في المنتصف
                      alignment: Alignment.center, // توسيط القيمة المختارة
                      value: selectedValue, // استخدم المتغير هنا
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(
                        color: Colors.white, // لون النص داخل القائمة
                        fontWeight: FontWeight.bold,
                      ),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          setState(() {
                            selectedValue = newValue; // تحديث القيمة
                          });
                        }
                      },
                      items: <String>['10%', '20%', '50%']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Center( // توسيط النص داخل القائمة
                            child: Padding(
                              padding: EdgeInsets.zero, // منع تحريك النص عشوائيًا
                              child: Text(
                                value,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
