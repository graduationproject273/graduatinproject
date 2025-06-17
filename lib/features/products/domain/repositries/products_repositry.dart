import 'package:dartz/dartz.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/features/products/domain/entities/product_entity.dart';
abstract class ProductsRepositry {
  Future<Either<Failure,List< ProductEntity>>>  getAllProducts(String endPoint);
}