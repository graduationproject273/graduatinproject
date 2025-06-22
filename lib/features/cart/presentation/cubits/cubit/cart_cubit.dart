// 📁 cart_cubit.dart
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gradution/features/cart/domain/entities/cart_entity.dart';
import 'package:gradution/features/cart/domain/entities/cart_item_entity.dart';
import 'package:gradution/features/cart/domain/usecases/cart_usecase.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartUseCase cartUseCase;
  StreamSubscription? _subscription;

  CartCubit(this.cartUseCase) : super(CartInitial());

  void getCartItems() {
    if (_subscription != null) return;

    emit(CartLoading());

    _subscription = cartUseCase.getCartItems().listen((result) {
      result.fold(
        (failure) => emit(CartError(message: failure.errMessage)),
        (cartItems) => emit(CartLoaded(productitems: cartItems)),
      );
    });
  }

  Future<void> addToCart(CartEntity cartItem) async {
    emit(CartLoading());
    final result = await cartUseCase.addToCart(cartItem);
    result.fold(
      (failure) => emit(CartError(message: failure.errMessage)),
      (_) => {},
    );
  }

  Future<void> clearCart() async {
    final result = await cartUseCase.clearCart();
    result.fold(
      (failure) => emit(CartError(message: failure.errMessage)),
      (_) => emit(CartLoaded(productitems: [])),
    );
  }

  Future<void> clearItemCart(int itemId) async {
    final result = await cartUseCase.clearItemCart(itemId);
    result.fold(
      (failure) => emit(CartError(message: failure.errMessage)),
      (_) {
        List<CartItemEntity> items = [];
        if (state is CartLoaded) {
          items = (state as CartLoaded).productitems;
        } else if (state is CartUpdated) {
          items = (state as CartUpdated).productitems;
        }
        final updatedItems = items.where((item) => item.id != itemId).toList();
        emit(CartLoaded(productitems: updatedItems));
      },
    );
  }

  Future<void> increaseQuantity(int itemId, int quantity) async {
    final result = await cartUseCase.updateCartItemQuantity(itemId, quantity);
    result.fold(
      (failure) => emit(CartError(message: failure.errMessage)),
      (_) {
        List<CartItemEntity> items = [];
        if (state is CartLoaded) {
          items = (state as CartLoaded).productitems;
        } else if (state is CartUpdated) {
          items = (state as CartUpdated).productitems;
        }
        final updatedItems = items.map((item) {
          if (item.id == itemId) {
            return item.copyWith(quantity: quantity);
          }
          return item;
        }).toList();
        emit(CartLoaded(productitems: updatedItems));
      },
    );
  }

  Future<void> decreaseQuantity(int itemId, int quantity) async {
    if (quantity > 1) {
      final result = await cartUseCase.updateCartItemQuantity(itemId, quantity);
      result.fold(
        (failure) => emit(CartError(message: failure.errMessage)),
        (_) {
          List<CartItemEntity> items = [];
          if (state is CartLoaded) {
            items = (state as CartLoaded).productitems;
          } else if (state is CartUpdated) {
            items = (state as CartUpdated).productitems;
          }
          final updatedItems = items.map((item) {
            if (item.id == itemId) {
              return item.copyWith(quantity: quantity);
            }
            return item;
          }).toList();
          emit(CartLoaded(productitems: updatedItems));
        },
      );
    }
  }

  double getTotalPrice() {
    if (state is CartLoaded || state is CartUpdated) {
      final items = (state is CartLoaded)
          ? (state as CartLoaded).productitems
          : (state as CartUpdated).productitems;
      return items.fold(
        0.0,
        (total, item) => total + (item.productcartentity.price * item.quantity),
      );
    }
    return 0.0;
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}

extension CartItemCopy on CartItemEntity {
  CartItemEntity copyWith({int? quantity}) {
    return CartItemEntity(
      id: this.id,
      quantity: quantity ?? this.quantity,
      productcartentity: this.productcartentity,
    );
  }
}