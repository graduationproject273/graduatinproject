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

  // 🔥 الحل الأول: إصلاح addToCart
  Future<void> addToCart(CartEntity cartItem) async {
    // احفظ الحالة الحالية
    final currentState = state;

    // لا تعمل loading إذا كانت البيانات محملة
    if (state is! CartLoaded && state is! CartUpdated) {
      emit(CartLoading());
    }

    final result = await cartUseCase.addToCart(cartItem);
    result.fold(
      (failure) => emit(CartError(message: failure.errMessage)),
      (addedItem) {
        emit(AddtoCartLoaded());
        // ✅ تحديث فوري للـ UI
        if (currentState is CartLoaded) {
          final currentItems = (currentState).productitems;
          _updateCartWithNewItem(currentItems, addedItem);
        } else if (currentState is CartUpdated) {
          final currentItems = (currentState ).productitems;
          _updateCartWithNewItem(currentItems, addedItem);
        } else {
          // إعادة تحميل إذا لم تكن السلة محملة
          getCartItems();
        }
      },
    );
  }

  // 🔥 الحل الثاني: addToCart بدون loading (الأسرع)
  Future<void> addToCartSilently(CartEntity cartItem) async {
    final result = await cartUseCase.addToCart(cartItem);
    result.fold(
      (failure) => emit(CartError(message: failure.errMessage)),
      (addedItem) {
        // تحديث محلي فقط
        if (state is CartLoaded) {
          final currentItems = (state as CartLoaded).productitems;
          _updateCartWithNewItem(currentItems, addedItem);
        } else if (state is CartUpdated) {
          final currentItems = (state as CartUpdated).productitems;
          _updateCartWithNewItem(currentItems, addedItem);
        }
        // لا تعمل getCartItems() هنا
      },
    );
  }

  // دالة مساعدة للتحديث
  void _updateCartWithNewItem(
      List<CartItemEntity> currentItems, CartItemEntity newItem) {
    final existingIndex =
        currentItems.indexWhere((item) => item.id == newItem.id);

    List<CartItemEntity> updatedItems;
    if (existingIndex != -1) {
      // تحديث الكمية للعنصر الموجود
      updatedItems = List.from(currentItems);
      final existingItem = currentItems[existingIndex];
      updatedItems[existingIndex] = existingItem.copyWith(
          quantity: existingItem.quantity + newItem.quantity);
    } else {
      // إضافة عنصر جديد
      updatedItems = [...currentItems, newItem];
    }

    emit(CartLoaded(productitems: updatedItems));
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

        // ✅ مش ناسي الـ emit هنا
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

          // ✅ مش ناسي الـ emit هنا كمان
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
      id: id,
      quantity: quantity ?? this.quantity,
      productcartentity: productcartentity,
    );
  }
}
