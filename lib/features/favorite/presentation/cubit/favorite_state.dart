// Updated states
part of 'favorite_cubit.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object?> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteAdded extends FavoriteState {
  final FavoriteEntity favorite;
  
  const FavoriteAdded({required this.favorite});
  
  @override
  List<Object?> get props => [favorite];
}

class FavoriteRemoved extends FavoriteState {}

class FavoriteIsTrue extends FavoriteState {}

class FavoriteIsFalse extends FavoriteState {}

class FavoriteLoaded extends FavoriteState {
  final List<ProductEntity> products;
  
  const FavoriteLoaded({required this.products});
  
  @override
  List<Object?> get props => [products];
}

class FavoriteError extends FavoriteState {
  final String? message;
  
  const FavoriteError({this.message});
  
  @override
  List<Object?> get props => [message];
}