import 'package:gradution/core/databases/params/params.dart';
import 'package:gradution/features/orders/domain/repositories/order_repositry.dart';

class CreateOrder {
  final OrderRepositry orderRepositry;
  CreateOrder(this.orderRepositry);
  Future<void> call(OrderParams  order) async {
    await orderRepositry.createOrder(order);
  }
}