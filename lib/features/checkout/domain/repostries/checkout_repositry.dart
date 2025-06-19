import 'package:dartz/dartz.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/features/checkout/data/item_oreder_model.dart';
import 'package:gradution/features/orders/domain/entities/order_entity.dart';

abstract class CheckoutRepositry {
  Future< Either<Failure, OrderEntity>> createOrder( {required String paymentMethod,
  required String shippingAddress,
  required List<ItemOrderModel> items });
}