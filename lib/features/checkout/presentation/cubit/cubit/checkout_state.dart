part of 'checkout_cubit.dart';

sealed class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object> get props => [];
}

final class CheckoutInitial extends CheckoutState {}

final class CheckoutLoading extends CheckoutState {}

final class CheckoutSuccess extends CheckoutState {}

final class CheckoutError extends CheckoutState {
  final String message;
  const CheckoutError(this.message);
}

class CheckoutPaymentMethodChanged extends CheckoutState {
  final String method;

  const CheckoutPaymentMethodChanged(this.method);
}

class CheckoutAddressSavedToggled extends CheckoutState {
  final bool isSaved;
  const CheckoutAddressSavedToggled(this.isSaved);
}
