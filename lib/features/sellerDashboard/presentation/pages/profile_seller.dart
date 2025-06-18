import 'package:flutter/material.dart';
import 'package:gradution/features/sellerDashboard/presentation/widgets/profile_seller_widget.dart';

class ProfileSeller extends StatelessWidget {
  const ProfileSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ProfileSellerWidget()
    );
  }
}