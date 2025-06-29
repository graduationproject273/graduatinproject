
import 'package:dartz/dartz.dart';
import 'package:gradution/core/databases/api/dio_consumer.dart';
import 'package:gradution/core/databases/api/end_points.dart';
import 'package:gradution/core/errors/expentions.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/features/feedback/data/models/feedback_model.dart';
import 'package:gradution/features/feedback/data/models/send_feedback.dart';
import 'package:gradution/features/feedback/domain/repositories/feedback_repositry.dart';

class FeedbackRepoImpli implements FeedbackRepository {
  final DioConsumer dioConsumer;

  FeedbackRepoImpli({required this.dioConsumer});
  @override
  Future<Either<Failure, List<FeedbackModel>>> getFeedbacksByProductId(
      int productId) async {
    try {
  final response = await dioConsumer.get(
   path:      '${EndPoints.baserUrl}/ $productId',
    queryParameters: {'productId': productId},
  );
   return response.fold(
      (l) => Left(Failure(errMessage: l)),
      (r) => Right((r.data.map((item) => FeedbackModel.fromJson(item)).toList()),
    ));
} 
    on ServerException catch (e) {
      return Left(Failure(errMessage: e.toString()));
      }
    }

  @override
  Future<Either<Failure, void>> sendFeedback({FeedbackSimpleModel? feedback, int? productId}) async {
    try{
      final response = await dioConsumer.post(
        path: EndPoints.feedback);
      return response.fold(
        (l) => Left(Failure(errMessage: l)),
        (r) => Right(null),
      );
    }  on ServerException catch (e) {
      return Left(Failure(errMessage: e.toString()));
    }
  }
}
