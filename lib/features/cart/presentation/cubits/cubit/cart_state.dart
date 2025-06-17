part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartLoaded extends CartState {
   final List<CartItemEntity> productitems;

  const CartLoaded( {required this.productitems});
}

final class AddtoCartLoaded extends CartState {
  final CartEntity cartItem;

  const AddtoCartLoaded({required this.cartItem});

  @override
  List<Object> get props => [cartItem];
}

final class CartError extends CartState {
  final String message;

  const CartError({required this.message});

  @override
  List<Object> get props => [message];
}

final class ClearCart extends CartState {

}
final class CartItemUpdated extends CartState {
  final int itemId;
  final int quantity;
  const CartItemUpdated({required this.itemId, required this.quantity});



  @override
  List<Object> get props => [itemId];
}