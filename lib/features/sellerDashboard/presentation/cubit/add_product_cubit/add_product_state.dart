part of 'add_product_cubit.dart';

sealed class AddProductState extends Equatable {
  const AddProductState();

  @override
  List<Object> get props => [];
}

final class AddProductInitial extends AddProductState {}
  class AddImage extends AddProductState {
  final String imageUrl;

  const AddImage(this.imageUrl);

  @override
  List<Object> get props => [imageUrl];
}
class ErrorImage extends AddProductState {
  final String errorMessage;

  const ErrorImage(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}


final class AddProductLoading extends AddProductState {}
final class AddProductSuccess extends AddProductState {
  final String message;

  const AddProductSuccess(this.message);

  @override
  List<Object> get props => [message];
}
final class GetAllCategorySuccess extends AddProductState {
  final List<GetAllCategoryEntity> categories;

  const GetAllCategorySuccess(this.categories);

  @override
  List<Object> get props => [categories];
}
final class AddProductFailure extends AddProductState {
  final String error;

  const AddProductFailure(this.error);

  @override
  List<Object> get props => [error];
}




final class GetFi extends AddProductState {
  final String error;

  const GetFi(this.error);

  @override
  List<Object> get props => [error];
}
