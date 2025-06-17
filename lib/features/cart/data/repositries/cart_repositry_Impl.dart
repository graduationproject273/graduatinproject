// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:gradution/core/databases/api/dio_consumer.dart';
import 'package:gradution/core/databases/api/end_points.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/features/cart/data/models/cart_model.dart';
import 'package:gradution/features/cart/domain/repositries/cart_repositry.dart';

late final DioConsumer dioConsumer ;

class CartRepositryImpl extends CartRepositry{
  @override
  Future<Either<Failure, CartItemModel>> addToCart(cart) async {
    try {
      final response = await dioConsumer.post(
        path: EndPoints.addtocart,
        data: CartItemModel(productId: cart.productId, quantity: cart.quantity)
      );
      return response.fold(
        (l) => Left(Failure(errMessage: l)),
        (r) => Right(r.data),
      );
    } catch (e) {
      return Left(Failure(errMessage: e.toString()));
    }
  }

 
  
}