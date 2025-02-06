// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/featrues/products/domain/entities/categories_entity.dart';
import 'package:gradution/featrues/products/domain/entities/products_entity.dart';
import 'package:gradution/featrues/products/domain/repositries/products_repositry.dart';

class ProductsRepositryImpl extends ProductsRepositry{
  @override
  Future<Either<Failure, ProductsEntity>> getProducts() {
    // TODO: implement getProducts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, CategoriesEntity>> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }
}