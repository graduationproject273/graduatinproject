import 'package:dartz/dartz.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/features/cart/domain/entities/cart_entity.dart';
import 'package:gradution/features/cart/domain/repositries/cart_repositry.dart';

class CartUseCase {
  final CartRepositry cartRepositry;

  CartUseCase({required this.cartRepositry});

  Future<Either<Failure, CartItemEntity>> addToCart(CartItemEntity cart) {
    return cartRepositry.addToCart(cart);
  }
}
