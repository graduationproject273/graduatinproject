import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/styles/textstyles.dart';
import 'package:gradution/core/widgets/custom_button.dart';
import 'package:gradution/core/widgets/custom_textfield.dart';
import 'package:gradution/features/authintication/sinup/data/models/user_model.dart';
import 'package:gradution/features/authintication/sinup/presentation/cubit/user_cubit/sinup_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution/core/routeing/routes.dart';

class SectionTextFiledAndButtoninSinup extends StatefulWidget {
  const SectionTextFiledAndButtoninSinup({super.key});

  @override
  State<SectionTextFiledAndButtoninSinup> createState() =>
      _SectionTextFiledAndButtoninSinupState();
}

class _SectionTextFiledAndButtoninSinupState
    extends State<SectionTextFiledAndButtoninSinup> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SinupCubit, SinupState>(
      listener: (context, state) {
        if (state is SinupSuccess) {
          GoRouter.of(context).go(Routes.home);
        } else if (state is SinupError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
   child:  Form(
          key:   context.read<SinupCubit>().formkey,
          child: Column(
            children: [
              CustomTextformfield(
                hintText: 'tomas257@gmail.com',
                keyboardType: TextInputType.emailAddress,
                color: Colors.white,
                colorborder: textcolorinauthpagebuttons,
                controller: context.read<SinupCubit>().emailController,
              ),
              const SizedBox(height: 20),
              CustomTextformfield(
                hintText: 'Password',
                keyboardType: TextInputType.number,
                color: Colors.white,
                colorborder: textcolorinauthpagebuttons,
                controller: context.read<SinupCubit>().passwordController,
              ),
              Row(
                children: [
                  Checkbox(
                    activeColor: maincolor,
                    value: isChecked,
                    onChanged: (bool? newValue) {
                      setState(() {
                        isChecked = newValue!;
                      });
                    },
                  ),
                  Text(
                    'I accept terms & conditions.',
                    style: Textstyles.descrpcolorinreviews
                        .copyWith(color: textcolorinauthpagebuttons),
                  )
                ],
              ),
              const SizedBox(height: 40),
              CustomButton(
                text: 'Sign Up',
                onTap: () {
                  if (context.read<SinupCubit>().formkey.currentState!.validate()) {
                    context.read<SinupCubit>().signup(UserModel(
                      email: context.read<SinupCubit>().emailController.text,
                      password: context.read<SinupCubit>().passwordController.text,
                    ));
                  }
                },
              ),
            ],
          ),
      )  );

      }
   
    
}
