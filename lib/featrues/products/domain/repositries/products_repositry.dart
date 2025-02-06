import 'package:dartz/dartz.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/featrues/products/domain/entities/categories_entity.dart';
import 'package:gradution/featrues/products/domain/entities/products_entity.dart';

abstract class ProductsRepositry {
  Future<Either<Failure, ProductsEntity>>  getProducts();
  Future<Either<Failure, CategoriesEntity>> getCategories();
}