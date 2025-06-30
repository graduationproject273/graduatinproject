import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/depency_injection.dart';
import 'package:gradution/features/feedback/presentation/cubit/feedback_cubit.dart';
import 'package:gradution/features/feedback/presentation/widgets/add_feedback_view_body.dart';

class AddFeedbackView extends StatelessWidget {
  const AddFeedbackView({super.key, required this.productId});
 final int productId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FeedbackCubit>.value(
        value: sl<FeedbackCubit>(),
        child: Scaffold(
          backgroundColor: Colors.grey[50],
          appBar: AppBar(
            title: const Text(
              'Feedback',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: maincolor,
            elevation: 0,
            centerTitle: true,
          ),
          body:  AddFeedbackPageBody(productId:productId ,),
        ));
  }
}
