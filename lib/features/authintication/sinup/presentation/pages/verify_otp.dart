// VerifyOtp.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution/depency_injection.dart';
import 'package:gradution/features/authintication/sinup/presentation/cubit/verify_otp/cubit/verifyotp_cubit.dart';
import 'package:gradution/features/authintication/sinup/presentation/widgets/otp_widget.dart';

class VerifyOtp extends StatelessWidget {
  // إضافة الإيميل كمعامل مطلوب
  final String email;
  
  const VerifyOtp({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<VerifyotpCubit>(),
      child: OTPVerificationPage(email: email),
    );
  }
}