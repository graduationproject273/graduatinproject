import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution/core/styles/textstyles.dart';
import 'package:gradution/depency_injection.dart';
import 'package:gradution/features/services/presentation/cubit/services_cubit.dart';
import 'package:gradution/features/services/presentation/widgets/body_view_service.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Let\'s Discuss \n Your Requirements!',
          style: Textstyles.texttitlelogin,
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => sl<ServicesCubit>(),
        child: BodyViewService(),
      ),
    );
  }
}
