import 'package:dartz/dartz.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/features/reviews/domein/entities/review_entitiy.dart';

abstract class ReviewRepository {
 Future<Either<Failure, List<ReviewEntitiy>>> getReview();

  
}