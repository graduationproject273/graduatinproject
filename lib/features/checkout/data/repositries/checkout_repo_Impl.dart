import 'package:dartz/dartz.dart';
import 'package:gradution/core/databases/api/dio_consumer.dart';
import 'package:gradution/core/databases/api/end_points.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/features/checkout/domain/repostries/checkout_repositry.dart';
import 'package:gradution/features/orders/data/models/order_model.dart';
import 'package:gradution/features/orders/domain/entities/order_entity.dart';

class CheckoutRepoImpl extends CheckoutRepositry{
  final DioConsumer dioConsumer;

  CheckoutRepoImpl(this.dioConsumer);
 @override
Future<Either<Failure, OrderEntity>> createOrder({
  required String paymentMethod,
  required String shippingAddress,
  required List<Map<String, dynamic>> items,
}) async {
  try {
    final response = await dioConsumer.post(
      path: EndPoints.createOrder,
      data: {
        'paymentMethod': paymentMethod,
        'shippingAddress': shippingAddress,
        'items': items,
      },
    );

    return response.fold(
      (l) => Left(Failure(errMessage: l)),
      (r) => Right(OrderModel.fromJson(r.data)),
    );
  } catch (e) {
    return Left(Failure(errMessage: e.toString()));
  }
}


}