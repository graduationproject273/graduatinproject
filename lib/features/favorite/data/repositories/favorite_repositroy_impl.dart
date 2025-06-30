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
Stream<Either<Failure, List<ProductEntity>>> getAllFavourites() async* {
  try {
    final response = await dioConsumer.get(path: EndPoints.favorites);

    if (response.isLeft()) {
      final errorMessage = response.fold((l) => l, (_) => '');
      yield Left(Failure(errMessage: errorMessage));
      return;
    }

    final data = response.fold((l) => null, (r) => r.data);

    if (data == null || (data is List && data.isEmpty)) {
      yield const Right([]);
    } else {
      try {
        final products = (data as List)
            .map((item) => ProductModel.fromJson(item))
            .toList();
        yield Right(products);
      } catch (e) {
        yield Left(Failure(errMessage: 'خطأ في تحليل البيانات: ${e.toString()}'));
      }
    }
  } catch (e) {
    yield Left(Failure(errMessage: 'خطأ غير متوقع: ${e.toString()}'));
  }
}


@override
Future<bool> isFavourite(int id) async {
  try {
    final response = await dioConsumer.get(
      path: '${EndPoints.favorites}/check?productId=$id',
    );

    return response.fold(
      (l) => false, // or handle error as needed
      (r) => r.data ,
    );
  } catch (e) {
    throw Failure(errMessage: e.toString()); // or handle error as needed
  }
}

  @override
  Future<Either<Failure, void>> removeFromFavourite(int id) async {
    try {
      final response = await dioConsumer.delete(
        path: "${EndPoints.favorites}/$id",
       
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
        data: {"productId": id},
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