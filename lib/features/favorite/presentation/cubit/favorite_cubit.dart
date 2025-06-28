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

  @override
  Future<void> close() {
    _favoritesSubscription?.cancel();
    return super.close();
  }

  Future<void> addToFavourite(int id) async {
    emit(FavoriteLoading());
    
    try {
      final result = await favoriteUsecase.addToFavourite(id);
      result.fold(
        (failure) {
          emit(FavoriteError(message: failure.errMessage));
        },
        (favorite) {
          emit(FavoriteAdded(favorite: favorite));
          // Also emit that this item is now a favorite
          emit(FavoriteIsTrue());
        },
      );
    } catch (e) {
      emit(FavoriteError(message: 'خطأ غير متوقع: ${e.toString()}'));
    }
  }

  Future<void> removeFromFavourite(int id) async {
    emit(FavoriteLoading());
    
    try {
      final result = await favoriteUsecase.removeFromFavourite(id);
      result.fold(
        (failure) => emit(FavoriteError(message: failure.errMessage)),
        (_) {
          emit(FavoriteIsFalse());
        },
      );
    } catch (e) {
      emit(FavoriteError(message: 'خطأ غير متوقع: ${e.toString()}'));
    }
  }

  Future<void> isFavourite(int id) async {
    try {
      final result = await favoriteUsecase.isFavourite(id);
      print('isFavourite result: $result');
      if (result) {
        emit(FavoriteIsTrue());
      } else {
        emit(FavoriteIsFalse());
      }
    } catch (e) {
      emit(FavoriteError(message: 'خطأ في التحقق من الحالة: ${e.toString()}'));
    }
  }

  void getAllFavourites() {
    emit(FavoriteLoading());
    
    // Cancel previous subscription if any
    _favoritesSubscription?.cancel();
    
    try {
      _favoritesSubscription = favoriteUsecase.getAllFavourites().listen(
        (result) {
          result.fold(
            (failure) => emit(FavoriteError(message: failure.errMessage)),
            (products) => emit(FavoriteLoaded(products: products)),
          );
        },
        onError: (error) {
          emit(FavoriteError(message: 'خطأ في تحميل المفضلة: ${error.toString()}'));
        },
      );
    } catch (e) {
      emit(FavoriteError(message: 'خطأ غير متوقع: ${e.toString()}'));
    }
  }

  // Toggle method for better UX
  Future<void> toggleFavorite(int id) async {
    try {
      final isFav = await favoriteUsecase.isFavourite(id);
      if (isFav) {
        await removeFromFavourite(id);
      } else {
        await addToFavourite(id);
      }
    } catch (e) {
      emit(FavoriteError(message: 'خطأ في تبديل الحالة: ${e.toString()}'));
    }
  }

  // Method to refresh favorites list
  void refreshFavorites() {
    getAllFavourites();
  }
}

