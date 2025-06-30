import 'package:dartz/dartz.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/features/feedback/data/models/feedback_model.dart';
import 'package:gradution/features/feedback/data/models/send_feedback.dart';

abstract class  FeedbackRepository {
  Future<Either<Failure, void>> sendFeedback({
FeedbackSimpleModel feedback,
int productId,
  });
  Future<Either<Failure, List<FeedbackModel>>> getFeedbacksByProductId(int productId);
}