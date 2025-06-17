part of 'get_product_seller_cubit.dart';

sealed class GetProductSellerState extends Equatable {
  const GetProductSellerState();

  @override
  List<Object> get props => [];
}

final class GetProductSellerInitial extends GetProductSellerState {}
final class GetProductSellerLoading extends GetProductSellerState {}
final class GetProductSellerSuccess extends GetProductSellerState {
  final List<ProductEntity> products;

  const GetProductSellerSuccess(this.products);

  @override
  List<Object> get props => [products];
}

final class GetAllProductError extends GetProductSellerState {
  final String message;

  const GetAllProductError(this.message);
}
