import 'package:dartz/dartz.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/featrues/reviews/domein/entities/review_entitiy.dart';
import 'package:gradution/featrues/reviews/domein/repository/review_repository.dart';

class GetReview {
  final ReviewRepository reviewRepository;
  GetReview({required this.reviewRepository});

  Future<Either<Failure, List<ReviewEntitiy>>> call() async {
    return await reviewRepository.getReview();
  }
}
