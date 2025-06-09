import 'package:dartz/dartz.dart';
import 'package:gradution/core/connection/network_info.dart';
import 'package:gradution/core/errors/expentions.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/features/products/data/datasource/product_data_sourse_local.dart';
import 'package:gradution/features/products/data/datasource/product_data_sourse_remote.dart';
import 'package:gradution/features/products/data/model/product_model.dart';
import 'package:gradution/features/products/domain/repositries/products_repositry.dart';

class ProductRepositryImpli implements ProductsRepositry {
  final ProductDataSourseLocal productDataSourseLocal;
  final ProductDataSourseRemote productDataSourseRemote;
  final NetworkInfo networkInfo;
  ProductRepositryImpli({
    required this.networkInfo,
    required this.productDataSourseLocal,
    required this.productDataSourseRemote,
  });
  @override
  Future<Either<Failure, List<ProductModel>>> getAllProducts() async {
    if (await networkInfo.isConnected!) {
      try {
        final products = await productDataSourseRemote.getAllProducts();
        await productDataSourseLocal.cacheproduct(products, '');
        return Right(products);
      } on  ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      // Handle the offline case, e.g., return cached products or a failure
      try {
        final products = await productDataSourseLocal.getLastProduct('');
        return Right(products);
      }on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    }
  }
}
