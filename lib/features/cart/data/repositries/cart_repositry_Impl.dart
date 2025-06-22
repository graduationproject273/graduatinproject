// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:gradution/core/databases/api/dio_consumer.dart';
import 'package:gradution/core/databases/api/end_points.dart';
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

  

  @override
Future<Either<Failure, CartEntity>> addToCart( cart) async {
  try {
    final response = await dioConsumer.post(
          path: EndPoints.addtocart,
          data: CartModel(productId: cart.productId, quantity: cart.quantity));

    return response.fold(
      (l) => Left(Failure(errMessage: l)),
      (r) {
        // 🔴 هنا غالبًا الخطأ
        // تأكد بتحول الـ Map إلى CartModel (اللي يمد CartEntity)
        return Right(CartModel.fromJson(r.data)); 
      },
    );
  } catch (e) {
    return Left(Failure(errMessage: e.toString()));
  }
}


  // Update the method signature to match the abstract class/interface
  @override

Stream<Either<Failure, List<CartItemEntity>>> getCartItems() async* {
  try {
    final response = await dioConsumer.get(path: EndPoints.getCartItems);
    yield response.fold(
      (l) => Left(Failure(errMessage: l)),
      (r) {
        final data = r.data;
        if (data == null || data.isEmpty) {
          return Right([]);
        }

        final items = (data as List)
            .map((item) => CartItemModel.fromJson(item)) // ✅ تأكد دي موجودة
            .cast<CartItemEntity>() // ⬅️ دي مهمة لو CartItemModel implements CartItemEntity
            .toList();

        return Right(items);
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
        (r) {
          return Right(null);
          
          },
      );
    } catch (e) {
      return Left(Failure(errMessage: e.toString()));
    }
  }
}
