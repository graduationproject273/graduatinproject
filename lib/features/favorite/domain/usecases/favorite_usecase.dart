import 'package:dartz/dartz.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/features/favorite/domain/entities/fivorite_entity.dart';
import 'package:gradution/features/favorite/domain/repositories/favourite_repsitry.dart';

class FavoriteUsecase {
  final FavoriteRepository favoriteRepository;
  FavoriteUsecase(this.favoriteRepository);

  Future<Either<Failure, FavoriteEntity>> addToFavourite(int id) =>
      favoriteRepository.addToFavourite(id);
 Future<Either<Failure,void>> removeFromFavourite(int id) =>
      favoriteRepository.removeFromFavourite(id);
  Stream<Either<Failure, List<FavoriteEntity>>> getAllFavourites() =>
      favoriteRepository.getAllFavourites();
  Future<bool> isFavourite(int id) => favoriteRepository.isFavourite(id);
}
