import 'package:gradution/core/databases/api/dio_consumer.dart';
import 'package:gradution/core/databases/api/end_points.dart';

import 'package:gradution/features/sellerDashboard/data/models/get_all_category_model.dart';

class GetAllCategoryDatasourseRemote {
  final DioConsumer dioConsumer;
  GetAllCategoryDatasourseRemote({required this.dioConsumer});

  Future<List<GetAllCategoryModel>> getCatergory(
    String endpoint,
  ) async {
    try {
      final result = await dioConsumer.get(path: EndPoints.getAllcatecgory);
      return result.fold(
        (error) => throw Exception(error),
        (response) => List<GetAllCategoryModel>.from(
          response.data.map((x) => GetAllCategoryModel.fromJson(x)),
        ),
      );
    } catch (e) {
      throw Exception('Failed to get categories: $e');
    }
  }
}
