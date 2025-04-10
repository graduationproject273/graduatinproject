import 'package:flutter/material.dart';
import 'package:gradution/core/styles/textstyles.dart';
import 'package:gradution/featrues/authintication/login/presentation/widgets/body_login_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text('Signin',style: Textstyles.texttitlelogin,),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body:BodyLoginView()
    );
  }
}