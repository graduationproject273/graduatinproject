import 'package:dartz/dartz.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/featrues/cart/domain/entities/cart_entity.dart';

abstract class CartRepositry {
   Future<Either<Failure,CartEntity>> getCart();
}