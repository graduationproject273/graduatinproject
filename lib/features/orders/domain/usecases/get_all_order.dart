import 'package:gradution/features/orders/domain/repositories/order_repositry.dart';

class GetAllOrder {
  final OrderRepositry orderRepositry;
  GetAllOrder(this.orderRepositry);
  Future<void> call(String token) async {
    await orderRepositry.getAllOrders(token);
  }
  
}