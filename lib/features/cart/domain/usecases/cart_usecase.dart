import 'package:dartz/dartz.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/features/cart/domain/entities/cart_entity.dart';
import 'package:gradution/features/cart/domain/entities/cart_item_entity.dart';
import 'package:gradution/features/cart/domain/repositries/cart_repositry.dart';

class CartUseCase {
  final CartRepositry cartRepositry;

  CartUseCase({required this.cartRepositry});

  Future<Either<Failure, CartEntity>> addToCart(CartEntity cart) {
    return cartRepositry.addToCart(cart);
  }

  Future<Either<Failure, List<CartItemEntity>>> getCartItems() {
    return cartRepositry.getCartItems();
  }

  Future<Either<Failure, void>> clearCart() {
    return cartRepositry.clearCart();
  }
}
