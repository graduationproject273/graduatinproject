 import 'package:flutter/material.dart';
import 'package:gradution/features/copouns/presentation/widgets/copoun_widget.dart';

class CopounView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CouponWidget(total: 1000,),
    );
  }
}