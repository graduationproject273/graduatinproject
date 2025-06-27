import 'package:dartz/dartz.dart';
import 'package:gradution/core/databases/api/dio_consumer.dart';
import 'package:gradution/core/databases/api/end_points.dart';
import 'package:gradution/core/errors/expentions.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/features/favorite/data/models/favorite_model.dart';
import 'package:gradution/features/favorite/domain/entities/fivorite_entity.dart';
import 'package:gradution/features/favorite/domain/repositories/favourite_repsitry.dart';

class FavoriteRepositroyImpl  implements FavoriteRepository{
  final DioConsumer dioConsumer;

  FavoriteRepositroyImpl({required this.dioConsumer});
  @override


  @override
  Stream<Either<Failure,List<FavoriteEntity>>> getAllFavourites() async* {
    try {
      final response = await dioConsumer.get(path: EndPoints.favorites);
      yield response.fold(
        (l) => Left(Failure(errMessage: l)),
        (r) {
          try {
            final data = r.data;
            if (data == null || (data is List && data.isEmpty)) {
              return Right(<FavoriteEntity>[]);
            }

            final items = (data as List)
                .map((item) => FavoriteModel.fromJson(item))
                .cast<FavoriteEntity>()
                .toList();

            return Right(items);
          } catch (e) {
            return Left(Failure(errMessage: 'خطأ في تحليل البيانات: ${e.toString()}'));
          }
        },
      );
    } catch (e) {
      yield Left(Failure(errMessage: e.toString()));
    }
  }

@override
Future<bool> isFavourite(int id) async {
  try {
    final response = await dioConsumer.get(
      path: '${EndPoints.favorites}/check?productId=$id',
    );

    // Assuming response is an Either type
    return response.fold(
      (l) => false, // or handle error as needed
      (r) => r.data != null && r.data.contains(id) ? true : false,
    );
  } catch (e) {
    return false; // or handle error as needed
  }
}

  @override
  Future<Either<Failure, void>> removeFromFavourite(int id) async {
    try {
      final response = await dioConsumer.delete(
        path: EndPoints.favorites,
       
      );

      return response.fold(
        (l) => Left(Failure(errMessage: l)),
        (r) => Right(null),
      );
    } catch (e) {
      return Left(Failure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, FavoriteEntity>> addToFavourite(int id)async {
  try {
      final response = await dioConsumer.post(
        path: EndPoints.favorites,
        data:id
      );

      return response.fold(
        (l) => Left(Failure(errMessage: l)),
        (r) {
          try {
            // ✅ تأكد إن البيانات موجودة
            if (r.data == null) {
              return Left(Failure(errMessage: 'لا توجد بيانات من الخادم'));
            }
            
            // تحويل البيانات إلى CartItemEntity
            final fav = FavoriteModel.fromJson(r.data);
            return Right(fav);
          } catch (e) {
            return Left(Failure(errMessage: 'خطأ في تحليل البيانات: ${e.toString()}'));
          }
        },
      );
    } on ServerException catch (e) {
      return Left(Failure(errMessage:  e.toString()));
    } catch (e) {
      return Left(Failure(errMessage: 'خطأ غير متوقع: ${e.toString()}'));
    }
  }
}