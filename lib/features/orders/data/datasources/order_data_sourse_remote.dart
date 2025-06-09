import 'package:gradution/core/databases/api/api_consumer.dart';
import 'package:gradution/core/databases/api/end_points.dart';
import 'package:gradution/core/databases/params/params.dart';
import 'package:gradution/features/orders/data/models/order_model.dart';

class OrderDataSourseRemote {
  final ApiConsumer apiConsumer;
  OrderDataSourseRemote(this.apiConsumer);
  Future<void> createOrder(
    OrderParams order,
  ) async {
    await apiConsumer.post(
        headers: {
          'Authorization': order.token,
        },
        EndPoints.baserUrl + EndPoints.orders,
        data: {
          "shippingAddress": order.shippingAddress,
          "paymentMethod": order.paymentMethod,
          "items": order.orderItems,
        });
  }

  Future<List<OrderModel>> getAllOrders(String token) async {
    // Fetch all orders from the API
    List<OrderModel> orders = [];
    final response = await apiConsumer.get(
      EndPoints.baserUrl + EndPoints.orders,
      headers: {
        'Authorization': token,
      },
    );
    for (var orderData in response) {
      orders.add(OrderModel.fromJson(orderData));
    }
    return orders;
  }
}
