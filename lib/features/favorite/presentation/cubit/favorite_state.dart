part of 'favorite_cubit.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class FavoriteInitial extends FavoriteState {}
class FavoriteLoading extends FavoriteState {}
class FavoriteIsTrue extends FavoriteState {}
class FavoriteIsFalse extends FavoriteState {}
class FavoriteError extends FavoriteState {
  final String message;

  const FavoriteError({required this.message});

  @override
  List<Object> get props => [message];
}
class FavoriteAdded extends FavoriteState {
  final FavoriteEntity favorite;

  const FavoriteAdded({required this.favorite});

  @override
  List<Object> get props => [favorite];
}

class FavoriteLoaded extends FavoriteState {
  final List<ProductEntity> products;

  const FavoriteLoaded({required this.products});
}
