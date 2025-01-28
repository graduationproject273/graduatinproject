import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/core/styles/textstyles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final TextStyle? titleStyle;
  final Color? backgroundColor;
  final bool centerTitle;

  const CustomAppBar({
    super.key,
    required this.title,
    this.titleStyle,
    this.backgroundColor,
    this.centerTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      backgroundColor: backgroundColor ?? Colors.white,
      title: Text(
        title,
        style:Textstyles.namereview.copyWith(
            fontSize: ScreenUtil().setSp(19), // استخدام setSp للخطوط
          ),
      ),
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}