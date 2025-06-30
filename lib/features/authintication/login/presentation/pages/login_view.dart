import 'package:flutter/material.dart';
import 'package:gradution/features/authintication/login/presentation/widgets/body_login_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        
        backgroundColor: Colors.white,
        body:BodyLoginView()
      ),
    );
  }
}