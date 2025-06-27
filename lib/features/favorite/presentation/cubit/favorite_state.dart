part of 'favorite_cubit.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object?> get props => [];
}

/// Initial state
class FavoriteInitial extends FavoriteState {}

/// Loading state
class FavoriteLoading extends FavoriteState {}

/// Item is favorite
class FavoriteIsTrue extends FavoriteState {}

/// Item is not favorite
class FavoriteIsFalse extends FavoriteState {}

/// Item successfully added to favorites
class FavoriteAdded extends FavoriteState {
  const FavoriteAdded({required this.favorite});
  
  final FavoriteEntity favorite;

  @override
  List<Object?> get props => [favorite];
}

/// Item successfully removed from favorites
class FavoriteRemoved extends FavoriteState {
  const FavoriteRemoved({required this.id});
  
  final int id;

  @override
  List<Object?> get props => [id];
}

/// List of all favorites loaded
class FavoriteListLoaded extends FavoriteState {
  const FavoriteListLoaded({required this.favorites});
  
  final List<FavoriteEntity> favorites;

  @override
  List<Object?> get props => [favorites];
}

/// Empty favorites list
class FavoriteListEmpty extends FavoriteState {}

/// Error state
class FavoriteError extends FavoriteState {
  const FavoriteError({required this.message});
  
  final String message;

  @override
  List<Object?> get props => [message];
}