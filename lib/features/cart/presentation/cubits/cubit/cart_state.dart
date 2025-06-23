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

  const CartLoaded({required this.productitems});

  @override
  List<Object> get props => [productitems];
}

final class CartUpdated extends CartState {
  final List<CartItemEntity> productitems;

  const CartUpdated({required this.productitems});

  @override
  List<Object> get props => [productitems];
}

final class AddtoCartLoaded extends CartState {
 


}

final class CartError extends CartState {
  final String message;

  const CartError({required this.message});

  @override
  List<Object> get props => [message];
}
