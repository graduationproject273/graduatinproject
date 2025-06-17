import 'package:gradution/core/databases/api/api_consumer.dart';
import 'package:gradution/features/products/data/model/product_model.dart';

class ProductDataSourseRemote {
  final ApiConsumer apiConsumer;
  ProductDataSourseRemote({required this.apiConsumer});
 Future <List<ProductModel>> getAllProducts(String endPoint) async {
  final List<ProductModel> productsList = [];
    final response = await apiConsumer.get(path:endPoint );
    response.fold(
      (error) {
        // Handle the error as needed, e.g., throw or log
        throw Exception(error);
      },
      (res) {
        for (var item in res.data) {
          productsList.add(ProductModel.fromJson(item));
        }
      },
    );
    return productsList;
  }
}