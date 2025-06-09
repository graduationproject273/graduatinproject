import 'package:gradution/core/databases/api/api_consumer.dart';
import 'package:gradution/core/databases/api/end_points.dart';
import 'package:gradution/features/reviews/data/model/review_model.dart';

class ReviewDataSourseRemote {
  final ApiConsumer apiConsumer;

  ReviewDataSourseRemote({required this.apiConsumer});

  Future<List<ReviewModel>> getReview() async {
    final response = await apiConsumer.get(EndPoints.baserUrl);
    List<ReviewModel> data =[];
    for (var i = 0; i < response.length; i++) {
      data.add(ReviewModel.fromJson(response[i]));
    }
    return data;
  }
}
