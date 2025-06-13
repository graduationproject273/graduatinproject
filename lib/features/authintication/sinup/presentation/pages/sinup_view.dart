import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution/core/styles/textstyles.dart';
import 'package:gradution/depency_injection.dart';
import 'package:gradution/features/authintication/sinup/presentation/cubit/sinup_cubit.dart';
import 'package:gradution/features/authintication/sinup/presentation/widgets/sinup_body_view.dart';

class SinupView extends StatelessWidget {
  const SinupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Create Account',
            style: Textstyles.texttitlelogin,
          ),
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: BlocProvider<SinupCubit>(
          create: (context) => sl<SinupCubit>(),
          child: SinupBodyView(),
        ));
  }
}
