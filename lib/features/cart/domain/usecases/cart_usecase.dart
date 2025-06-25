import 'package:dartz/dartz.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/features/cart/domain/entities/cart_entity.dart';
import 'package:gradution/features/cart/domain/entities/cart_item_entity.dart';
import 'package:gradution/features/cart/domain/repositries/cart_repositry.dart';

class CartUseCase {
  final CartRepositry cartRepositry;

  CartUseCase({required this.cartRepositry});

  Future<Either<Failure, CartItemEntity>> addToCart(CartEntity cart) {
    return cartRepositry.addToCart(cart);
  }

  Stream<Either<Failure, List<CartItemEntity>>> getCartItems() {
    return cartRepositry.getCartItems();
  }

  Future<Either<Failure, void>> clearCart() {
    return cartRepositry.clearCart();
  }
  Future<Either<Failure, void>> clearItemCart(int itemId) {
    return cartRepositry.clearItemCart(itemId);
  }
    Future<Either<Failure, void>> updateCartItemQuantity(int itemId, int quantity) {
    return cartRepositry.updateCartItemQuantity(itemId, quantity);
  }
}
