import 'package:gradution/core/databases/api/api_consumer.dart';
import 'package:gradution/core/databases/api/end_points.dart';
import 'package:gradution/features/reviews/data/model/review_model.dart';

class ReviewDataSourseRemote {
  final ApiConsumer apiConsumer;

  ReviewDataSourseRemote({required this.apiConsumer});

  Future<List<ReviewModel>> getReview() async {
    final result = await apiConsumer.get(path: EndPoints.baserUrl);
    List<ReviewModel> data = [];
    result.fold(
      (error) {
        // Handle error as needed, e.g., throw or return empty list
        throw Exception(error);
      },
      (response) {
        // Assuming response.data is a List of JSON objects
        for (var item in response.data) {
          data.add(ReviewModel.fromJson(item));
        }
      },
    );
    return data;
  }
}
