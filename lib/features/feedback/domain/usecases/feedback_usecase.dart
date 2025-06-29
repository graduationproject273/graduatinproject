import 'package:dartz/dartz.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/features/feedback/data/models/feedback_model.dart';
import 'package:gradution/features/feedback/data/models/send_feedback.dart';
import 'package:gradution/features/feedback/domain/repositories/feedback_repositry.dart';

class FeedbackUsecase {
  final FeedbackRepository feedbackRepository;

  FeedbackUsecase({required this.feedbackRepository});
 Future<Either<Failure, void>> sendFeedback(
      {FeedbackSimpleModel? feedback, int? productid}) async {
    return await feedbackRepository.sendFeedback(
        feedback: feedback!, productId: productid!);
  }

  Future<Either<Failure, List<FeedbackModel>>> getFeedbacksByProductId(
          int productId) async =>
      await feedbackRepository.getFeedbacksByProductId(productId);
}
