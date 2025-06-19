part of 'edit_product_seller_cubit.dart';

sealed class EditProductSellerState extends Equatable {
  const EditProductSellerState();

  @override
  List<Object> get props => [];
}

final class EditProductSellerInitial extends EditProductSellerState {}
final class AddProductLoading extends EditProductSellerState {}
final class EditProductSellerSuccess extends EditProductSellerState {}
final class EditProductFailure extends EditProductSellerState {
  final String message;

  const EditProductFailure(this.message);

  @override
  List<Object> get props => [message];
}
final class EditProductSuccess extends EditProductSellerState {
  final AddProductEntity addProductModel;

  const EditProductSuccess(this.addProductModel);

  @override
  List<Object> get props => [addProductModel];
}
