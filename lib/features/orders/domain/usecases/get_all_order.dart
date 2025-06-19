import 'package:dartz/dartz.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/features/orders/domain/entities/order_entity.dart';
import 'package:gradution/features/orders/domain/repositories/order_repositry.dart';

class GetAllOrder {
  final OrderRepositry orderRepositry;
  GetAllOrder(this.orderRepositry);
  Future<Either<Failure, List<OrderEntity>>> call() async {
    return await orderRepositry.getAllOrders();
  }
  
}