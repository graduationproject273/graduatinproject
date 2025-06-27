import 'package:dartz/dartz.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/features/favorite/domain/entities/fivorite_entity.dart';

abstract class FavoriteRepository {
  Future<Either<Failure, FavoriteEntity>> addToFavourite(int id);
  Future<Either<Failure,void>> removeFromFavourite(int id);
  Future<bool> isFavourite(int id);
  Stream<Either<Failure,List<FavoriteEntity>>> getAllFavourites();
}