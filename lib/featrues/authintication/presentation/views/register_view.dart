import 'package:flutter/material.dart';
import 'package:gradution/core/routeing/routes.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Routes.login);
          },
          child: Text('Go to login'),
        ),
      ),
    );
  }
}