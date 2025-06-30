import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution/depency_injection.dart';
import 'package:gradution/features/authintication/sinup/presentation/cubit/generat_otp/otp_cubit.dart';
import 'package:gradution/features/authintication/sinup/presentation/widgets/body_otp_view.dart';

class GenerateOTPByEmail extends StatelessWidget {
  const GenerateOTPByEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => sl<OtpCubit>(),
        child: Scaffold(backgroundColor: Colors.white, body: BodyOTPView()),
      ),
    );
  }
}
