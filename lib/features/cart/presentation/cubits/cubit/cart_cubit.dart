import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gradution/features/cart/domain/entities/cart_entity.dart';
import 'package:gradution/features/cart/domain/entities/cart_item_entity.dart';
import 'package:gradution/features/cart/domain/usecases/cart_usecase.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartUseCase cartUseCase;
  CartCubit(this.cartUseCase) : super(CartInitial());

  Future<void> addToCart(CartEntity cartItem) async {
    emit(CartLoading());
    final result = await cartUseCase.addToCart(cartItem);
    result.fold(
      (failure) => emit(CartError(message: failure.errMessage)),
      (cartItem) => emit(AddtoCartLoaded(cartItem: cartItem)),
    );
  }

  Future<void> getCartItems() async {
    emit(CartLoading());
    final result = await cartUseCase.getCartItems();
    result.fold(
      (failure) => emit(CartError(message: failure.errMessage)),
      (cartItems) => emit(CartLoaded(productitems: cartItems)),
    );
  }

  Future<void> clearCart() async {
    emit(CartLoading());
    final result = await cartUseCase.clearCart();
    result.fold(
      (failure) => emit(CartError(message: failure.errMessage)),
      (_) {},
    );
  }

  Future<void> clearItemCart(int itemId) async {
    emit(CartLoading());
    final result = await cartUseCase.clearItemCart(itemId);
    await getCartItems();
    result.fold(
      (failure) => emit(CartError(message: failure.errMessage)),
      (_) {},
    );
  }

  double getTotalPrice() {
    if (state is CartLoaded) {
      final items = (state as CartLoaded).productitems;
      return items.fold(0.0,
          (total, item) => total + (item.productcartentity.price * item.quantity));
    }
    return 0.0;
  }

  int getTotalQuantity(List<CartItemEntity> cartItems) {
    return cartItems.fold(0, (total, item) => total + item.quantity);
  }

  Future<void> increaseQuantity(int itemId, int quantity) async {
    final result = await cartUseCase.updateCartItemQuantity(itemId, quantity);
    result.fold(
      (failure) => emit(CartError(message: failure.errMessage)),
      (_) async => await getCartItems(),
    );
  }

  Future<void> decreaseQuantity(int itemId, int quantity) async {
    if (quantity > 1) {
      final result = await cartUseCase.updateCartItemQuantity(itemId, quantity);
      result.fold(
        (failure) => emit(CartError(message: failure.errMessage)),
        (_) async => await getCartItems(),
      );
    }
  }
}
