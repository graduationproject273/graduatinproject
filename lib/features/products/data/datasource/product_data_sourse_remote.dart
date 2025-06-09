import 'package:gradution/core/databases/api/api_consumer.dart';
import 'package:gradution/core/databases/api/end_points.dart';
import 'package:gradution/features/products/data/model/product_model.dart';

class ProductDataSourseRemote {
  final ApiConsumer apiConsumer;
  ProductDataSourseRemote({required this.apiConsumer});
 Future <List<ProductModel>> getAllProducts() async {
  final List<ProductModel> productsList = [];
    final response = await apiConsumer.get(EndPoints.baserUrl + EndPoints.products);
   for (var item in response.data) {
      productsList.add(ProductModel.fromJson(item));
    }
    return productsList;
  }
}