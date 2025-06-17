import 'package:dartz/dartz.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/features/cart/domain/entities/cart_entity.dart';

abstract class CartRepositry {
  Future<Either<Failure, CartItemEntity>> addToCart(CartItemEntity cart);
}