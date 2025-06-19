import 'package:dartz/dartz.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/features/orders/domain/entities/order_entity.dart';

abstract class OrderRepositry {
Future<Either<Failure, List<OrderEntity>>> getAllOrders();
}