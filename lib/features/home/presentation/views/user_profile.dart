import 'package:flutter/material.dart';
import 'package:gradution/features/home/presentation/views/widgets/user_profile_widget.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: UserProfileWidget()),
    );
  }
}
