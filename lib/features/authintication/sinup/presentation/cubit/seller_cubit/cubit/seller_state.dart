part of 'seller_cubit.dart';

sealed class SellerState extends Equatable {
  const SellerState();

  @override
  List<Object> get props => [];
}

final class SellerInitial extends SellerState {}

final class SellerLoading extends SellerState {}

final class SellerError extends SellerState {
  final String message;

  const SellerError(this.message);

  @override
  List<Object> get props => [message];
}
final class SellerSuccess extends SellerState {
  final SellerEntity seller;

  const SellerSuccess(this.seller);

  @override
  List<Object> get props => [seller];
}
final class SellerUpdateSuccess extends SellerState {
  final SellerEntity seller;

  const SellerUpdateSuccess(this.seller);

  @override
  List<Object> get props => [seller];
}
