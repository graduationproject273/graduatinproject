import 'package:dartz/dartz.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/features/cart/domain/entities/cart_entity.dart';
import 'package:gradution/features/cart/domain/entities/cart_item_entity.dart';

abstract class CartRepositry {
  Future<Either<Failure, CartEntity>> addToCart(CartEntity cart);
  Stream<Either<Failure, List<CartItemEntity>>> getCartItems();
  Future<Either<Failure, void>> clearCart();
  Future<Either<Failure, void>> clearItemCart(int itemId);
  Future<Either<Failure, void>> updateCartItemQuantity(int itemId, int quantity);
}
