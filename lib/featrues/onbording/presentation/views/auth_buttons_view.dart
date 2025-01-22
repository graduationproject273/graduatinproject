import 'package:flutter/material.dart';
import 'package:gradution/featrues/onbording/presentation/views/widgets/auth_buttons_view_body.dart';

class AuthButtonsView extends StatelessWidget {
  const AuthButtonsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: AuthButtonsViewBody()),);
  }
}