part of 'get_all_category_cubit.dart';

sealed class GetAllCategoryState extends Equatable {
  const GetAllCategoryState();

  @override
  List<Object> get props => [];
}

final class GetAllCategoryInitial extends GetAllCategoryState {}
final class GetAllCategoryLoading extends GetAllCategoryState {}
final class GetAllCategoyError extends GetAllCategoryState {
  final String error;

  const GetAllCategoyError(this.error);

  @override
  List<Object> get props => [error];
}
final class GetAllCategorySuccess extends GetAllCategoryState {
  final List<GetAllCategoryEntity> categories;

  const GetAllCategorySuccess(this.categories);

  @override
  List<Object> get props => [categories];
}

