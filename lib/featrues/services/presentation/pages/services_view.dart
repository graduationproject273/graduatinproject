import 'package:flutter/material.dart';
import 'package:gradution/featrues/services/presentation/widgets/body_about_your_home.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Services'),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body:BodyAboutYourHome() ,
    );
  }
}
