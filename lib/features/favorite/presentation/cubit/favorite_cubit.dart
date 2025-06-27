import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gradution/features/favorite/domain/entities/fivorite_entity.dart';
import 'package:gradution/features/favorite/domain/usecases/favorite_usecase.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this.favoriteUsecase) : super(FavoriteInitial());
  
  final FavoriteUsecase favoriteUsecase;
  StreamSubscription? _favoritesSubscription;
  
  // Cache to store favorite status
  final Map<int, bool> _favoriteCache = {};
  
  @override
  Future<void> close() {
    _favoritesSubscription?.cancel();
    return super.close();
  }

  /// Add item to favorites
  Future<void> addToFavourite(int id) async {
    try {
      emit(FavoriteLoading());
      
      final result = await favoriteUsecase.addToFavourite(id);
      
      result.fold(
        (failure) {
          emit(FavoriteError(message: failure.errMessage));
          // Revert to previous state if known
          if (_favoriteCache.containsKey(id)) {
            emit(_favoriteCache[id]! ? FavoriteIsTrue() : FavoriteIsFalse());
          }
        },
        (favorite) {
          _favoriteCache[id] = true;
          emit(FavoriteIsTrue());
        },
      );
    } catch (e) {
      emit(FavoriteError(message: 'Failed to add to favorites: ${e.toString()}'));
    }
  }

  /// Remove item from favorites
  Future<void> removeFromFavourite(int id) async {
    try {
      emit(FavoriteLoading());
      
      final result = await favoriteUsecase.removeFromFavourite(id);
      
      result.fold(
        (failure) {
          emit(FavoriteError(message: failure.errMessage));
          // Revert to previous state if known
          if (_favoriteCache.containsKey(id)) {
            emit(_favoriteCache[id]! ? FavoriteIsTrue() : FavoriteIsFalse());
          }
        },
        (_) {
          _favoriteCache[id] = false;
          emit(FavoriteIsFalse());
        },
      );
    } catch (e) {
      emit(FavoriteError(message: 'Failed to remove from favorites: ${e.toString()}'));
    }
  }

  /// Check if item is favorite
  Future<void> isFavourite(int id) async {
    try {
      // Return cached result if available
      if (_favoriteCache.containsKey(id)) {
        emit(_favoriteCache[id]! ? FavoriteIsTrue() : FavoriteIsFalse());
        return;
      }
      
      emit(FavoriteLoading());
      
      final result = await favoriteUsecase.isFavourite(id);
      
      // Cache the result
      _favoriteCache[id] = result;
      
      if (result) {
        emit(FavoriteIsTrue());
      } else {
        emit(FavoriteIsFalse());
      }
    } catch (e) {
      emit(FavoriteError(message: 'Failed to check favorite status: ${e.toString()}'));
    }
  }

  /// Toggle favorite status
  Future<void> toggleFavorite(int id) async {
    try {
      // Get current status
      final isCurrentlyFavorite = _favoriteCache[id] ?? false;
      
      if (isCurrentlyFavorite) {
        await removeFromFavourite(id);
      } else {
        await addToFavourite(id);
      }
    } catch (e) {
      emit(FavoriteError(message: 'Failed to toggle favorite: ${e.toString()}'));
    }
  }

  /// Get all favorites with proper stream handling
  void getAllFavourites() {
    try {
      emit(FavoriteLoading());
      
      // Cancel previous subscription
      _favoritesSubscription?.cancel();
      
      _favoritesSubscription = favoriteUsecase.getAllFavourites().listen(
        (result) {
          result.fold(
            (failure) => emit(FavoriteError(message: failure.errMessage)),
            (favorites) {
              // Update cache with all favorites
              _updateCacheWithFavorites(favorites);
              emit(FavoriteListLoaded(favorites: favorites));
            },
          );
        },
        onError: (error) {
          emit(FavoriteError(message: 'Stream error: ${error.toString()}'));
        },
      );
    } catch (e) {
      emit(FavoriteError(message: 'Failed to get favorites: ${e.toString()}'));
    }
  }

  /// Update local cache with favorite items
  void _updateCacheWithFavorites(List<FavoriteEntity> favorites) {
    // Clear existing cache
    _favoriteCache.clear();
    
    // Update cache with current favorites
    for (final favorite in favorites) {
      _favoriteCache[favorite.id] = true;
    }
  }

  /// Clear cache (useful for logout or data refresh)
  void clearCache() {
    _favoriteCache.clear();
    emit(FavoriteInitial());
  }

  /// Get cached favorite status (synchronous)
  bool? getCachedFavoriteStatus(int id) {
    return _favoriteCache[id];
  }

  /// Refresh favorite status for specific item
  Future<void> refreshFavoriteStatus(int id) async {
    // Remove from cache to force refresh
    _favoriteCache.remove(id);
    await isFavourite(id);
  }
}