import 'package:flutter/material.dart';
import 'package:gradution/core/widgets/custom_appbar.dart';
import 'package:gradution/features/reviews/presentation/view/widgets/show_reviews.dart';

class ReviewsView extends StatelessWidget {
  const ReviewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: CustomAppBar(title: 'Reviews',),
      backgroundColor: Colors.white,
      body: const ShowReviews(),
    );
  }
}