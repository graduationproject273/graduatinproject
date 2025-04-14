import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/styles/extention.dart';
import 'package:gradution/core/styles/textstyles.dart';
import 'package:gradution/core/widgets/custom_textfield.dart';

class IndoorCameraSystem extends StatefulWidget {
  const IndoorCameraSystem({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _IndoorCameraSystemState createState() => _IndoorCameraSystemState();
}

class _IndoorCameraSystemState extends State<IndoorCameraSystem> {
  String? selectedOption; // لتخزين القيمة المختارة

  final List<String> options = ["2MB", "4MB", "6MB", "8MB"];
  String? selectedOption2; // لتخزين القيمة المختارة

  final List<String> options2 = ["Wired", "Wireless"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Number of cameras*',
            style: TextStyle(fontSize: 16.sp, color: Colors.black),
          ),
          CustomTextformfield(
            hintText: 'i.e 2 cameras',
            keyboardType: TextInputType.number,
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: maincolor,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Connection*",
            style: Textstyles.namereview
                .copyWith(color: Color(0xFF9A9A9A), fontSize: 16.sp),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(options2.length, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedOption = options2[index];
                  });
                },
                child: Row(
                  children: [
                    Radio<String>(
                      value: options2[index],
                      groupValue: selectedOption2,
                      activeColor: maincolor,
                      onChanged: (value) {
                        setState(() {
                          selectedOption2 = value;
                        });
                      },
                    ),
                    Text(options2[index]),
                    SizedBox(width: 20), // مسافة بين الراديوهات
                  ],
                ),
              );
            }),
          ),
          Text(
            "Resolution*",
            style: Textstyles.namereview
                .copyWith(color: Color(0xFF9A9A9A), fontSize: 16.sp),
          ),
          SizedBox(
            height: context.height * 0.15, // ارتفاع الـ GridView
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(), // منع التمرير
              shrinkWrap: true, // لتقليل حجم الـ GridView
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // عدد الأعمدة (صفين × عمودين)
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 3, // تناسب العرض مع الارتفاع
              ),
              itemCount: options.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedOption = options[index];
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio<String>(
                        activeColor: maincolor,
                        value: options[index],
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value;
                          });
                        },
                      ),
                      Text(options[index]),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
