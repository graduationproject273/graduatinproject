import 'package:flutter/material.dart';
import 'package:gradution/core/styles/textstyles.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      title: Text('User Type', style: Textstyles.namereview),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
