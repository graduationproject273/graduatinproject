import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gradution/features/favorite/domain/entities/fivorite_entity.dart';
import 'package:gradution/features/favorite/domain/usecases/favorite_usecase.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this.favoriteUsecase) : super(FavoriteInitial());
  final FavoriteUsecase favoriteUsecase;
  Future<void> addToFavourite(int id) async {
    final result = await favoriteUsecase.addToFavourite(id);
    result.fold(
      (failure) {
        emit(FavoriteError(message: failure.errMessage));
      },
      (favorite) {
        emit(FavoriteAdded(favorite: favorite));
      },
    );
  }
  Future<void> removeFromFavourite(int id) async {
    final result = await favoriteUsecase.removeFromFavourite(id);
    result.fold(
      (failure) => emit(FavoriteError(message: failure.errMessage)),
      (_) {},
    );
  }
  Future<void> isFavourite(int id) async {
    final result = await favoriteUsecase.isFavourite(id);
    if (result) {
      emit(FavoriteIsTrue());
    } else {
      emit(FavoriteIsFalse());
    }
  }
  void getAllFavourites() {
    emit(FavoriteLoading());
    favoriteUsecase.getAllFavourites().listen((result) {
      result.fold(
        (failure) => emit(FavoriteError(message: failure.errMessage)),
        (favorites) => emit(FavoriteIsTrue()),
      );
    });
  }

}
