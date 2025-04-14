import 'package:flutter/material.dart';
import 'package:gradution/core/styles/textstyles.dart';
import 'package:gradution/featrues/services/presentation/widgets/body_smart_application.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text('Services',style: Textstyles.texttitlelogin,),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: BodySmartApplication(),
    );
  }
}
