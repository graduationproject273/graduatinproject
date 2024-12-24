import 'package:flutter/material.dart';
import 'package:gradution/core/routeing/routes.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text('Login'),
     ),
     body: Center(
       child: GestureDetector(
         onTap: () {
           Navigator.pushNamed(context, Routes.home);
         },
         child: Text('Go to home'),
       ),
     ),
    );
  }
}