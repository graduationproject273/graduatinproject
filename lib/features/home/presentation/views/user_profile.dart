import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution/depency_injection.dart';
import 'package:gradution/features/home/presentation/cubit/cubit/userprofile_cubit.dart';
import 'package:gradution/features/home/presentation/views/widgets/user_profile_widget.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: BlocProvider(
        create: (context) => sl<UserprofileCubit>()..getUserProfile(),
        child: UserProfileWidget(),
      )),
    );
  }
}
