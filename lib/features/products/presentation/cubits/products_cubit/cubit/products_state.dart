part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsLoaded extends ProductsState {
  final List<ProductEntity> products;
   ProductsLoaded(this.products);
}

final class ProductsError extends ProductsState {
  final String message;
   ProductsError(this.message);
}
