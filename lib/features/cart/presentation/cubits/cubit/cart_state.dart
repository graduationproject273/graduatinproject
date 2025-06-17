part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartLoaded extends CartState {
  
}

final class AddtoCartLoaded extends CartState {
  final CartItemEntity cartItem;

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