import 'package:dartz/dartz.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/features/sellerDashboard/data/models/add_product_model.dart';
import 'package:gradution/features/sellerDashboard/domain/entities/add_product_entity.dart';
import 'package:gradution/features/sellerDashboard/domain/entities/get_all_category_entity.dart';

abstract class SellerRepositry {
  Future<Either<Failure,AddProductEntity>> addProduct(AddProductModel add);
  Future<Either<Failure, List<GetAllCategoryEntity>>> getAllProducts();
  Future<Either<Failure, void>> deleteSeller();
}
