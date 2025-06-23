import 'package:dartz/dartz.dart';
import 'package:gradution/core/databases/api/dio_consumer.dart';
import 'package:gradution/core/databases/api/end_points.dart';
import 'package:gradution/core/errors/expentions.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/features/cart/data/models/cart_item_model.dart';
import 'package:gradution/features/cart/data/models/cart_model.dart';
import 'package:gradution/features/cart/domain/entities/cart_entity.dart';
import 'package:gradution/features/cart/domain/entities/cart_item_entity.dart';
import 'package:gradution/features/cart/domain/repositries/cart_repositry.dart';

class CartRepositryImpl extends CartRepositry {
  final DioConsumer dioConsumer;
  CartRepositryImpl({required this.dioConsumer});

  @override
  Future<Either<Failure, CartItemEntity>> addToCart(CartEntity cart) async {
    try {
      final response = await dioConsumer.post(
        path: EndPoints.addtocart,
        data: CartModel(productId: cart.productId, quantity: cart.quantity).toJson()
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
            final cartItem = CartItemModel.fromJson(r.data);
            return Right(cartItem);
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

  @override
  Stream<Either<Failure, List<CartItemEntity>>> getCartItems() async* {
    try {
      final response = await dioConsumer.get(path: EndPoints.getCartItems);
      yield response.fold(
        (l) => Left(Failure(errMessage: l)),
        (r) {
          try {
            final data = r.data;
            if (data == null || (data is List && data.isEmpty)) {
              return Right(<CartItemEntity>[]);
            }

            final items = (data as List)
                .map((item) => CartItemModel.fromJson(item))
                .cast<CartItemEntity>()
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
  Future<Either<Failure, void>> clearCart() async {
    try {
      final response = await dioConsumer.delete(path: EndPoints.clearCart);
      return response.fold(
        (l) => Left(Failure(errMessage: l)),
        (r) => Right(null),
      );
    } catch (e) {
      return Left(Failure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> clearItemCart(int itemId) async {
    try {
      final response =
          await dioConsumer.delete(path: '${EndPoints.addtocart}/$itemId');
      return response.fold(
        (l) => Left(Failure(errMessage: l)),
        (r) => Right(null),
      );
    } catch (e) {
      return Left(Failure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateCartItemQuantity(
      int itemId, int quantity) async {
    try {
      final response = await dioConsumer
          .put(path: "${EndPoints.addtocart}/$itemId", data: {'quantity': quantity});
      return response.fold(
        (l) => Left(Failure(errMessage: l)),
        (r) => Right(null),
      );
    } catch (e) {
      return Left(Failure(errMessage: e.toString()));
    }
  }
}